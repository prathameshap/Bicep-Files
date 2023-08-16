///############## container-registry.bicep #################

targetScope = 'resourceGroup'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: 'demoacr1000'
  location: resourceGroup().location
  sku:{
    name:'Basic'
  }
  properties:{
    adminUserEnabled: true
  }
}

output containerRegistryLoginServer string = containerRegistry.properties.loginServer
