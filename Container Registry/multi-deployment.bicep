///############ multi-deployment.bicep ################

targetScope = 'subscription'

param azureRegion string = 'eastus'

resource appGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-applications-rg'
  location: azureRegion
  tags:{
    'project' : 'Bicep Demo'
  }
}

module appService '../Webapps Templates/Simple Web App Template/azurewebapp.bicep' = {
  scope: resourceGroup(appGroup.name)
  name: 'webAppDeployment-${uniqueString(appGroup.id)}'
}

resource containerGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-containers-rh'
  location: azureRegion
  tags:{
    'Project' : 'Bicep Demo'
  }
}

module containerRegistry 'container-registry.bicep' = {
  scope: resourceGroup(containerGroup.name)
  name: 'acrDeployment-${uniqueString(containerGroup.id)}'
}

resource storageGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-storage-rg'
  location: azureRegion
  tags:{
    'Project' : 'Bicep Demo'
  }
}

module bicepStorage '../Storage Templates/Simple ADSL gen2 storage account without containers/simplebicepstorage.bicep' = {
  scope: resourceGroup(storageGroup.name)
  name: 'storageDeploymnet-${uniqueString(storageGroup.id)}'
  params: {
    storageName: 'bicepstg1000'
    storageRegion: azureRegion
  }
}
