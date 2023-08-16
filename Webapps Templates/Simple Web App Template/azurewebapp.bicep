param azureRegion string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'aspLinkDemo104'
  location: azureRegion
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource wbAppResource 'Microsoft.Web/sites@2021-01-15' = {
  name: 'my-demo-linkedapp104'
  location: azureRegion
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}

@description('outputs')
output webApplicationHostName string = wbAppResource.properties.defaultHostName
