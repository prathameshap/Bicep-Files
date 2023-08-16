///################## deploy-module.bicep ####################

@description('parameters')
param webAppRegion string= resourceGroup().location

@description('webAppDescription')
module appService './Simple Web App Template/azurewebapp.bicep' = {
  name: 'myNewBicepAppDeployment'
  params: {
    azureRegion: webAppRegion
  }
}

@description('output')
output appServiceHostName string = appService.outputs.webApplicationHostName
