////############ simplestorage.bicep ###############

///ADSL V2 Storage Account deplyment without any storage containers with default scope as resource group(Azure default)

//targetScope = 'resourceGroup' //default

@description('Storage account parameters with default values overriden')
param storageName string 
param storageRegion string 
param environment string = 'dev'
//param storageAccountKind string = 'StorageV2'

@description('Storage account varibales')
var accountName = '${storageName}${environment}'
var storageAccountSkuName = (environment == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

@description('Storage Acount Description-parameters in the parameters file')
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: accountName
  location: storageRegion
  sku: { 
    name: storageAccountSkuName 
    //tier is a read only property for sku
  }
  kind: 'StorageV2'
}


@description('Output values')
output storageId string =  bicepStorage.id
output blobEndpoint string = bicepStorage.properties.primaryEndpoints.blob
