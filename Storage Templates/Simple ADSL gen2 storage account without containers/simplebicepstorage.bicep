///ADSL V2 Storage Account deplyment without any storage containers with default scope as resource group(Azure default)

//targetScope = 'resourceGroup' //default

//@description('Storage account parameters with default values overriden')
param storageName string 
param storageRegion string 
param storageSku string
//param storageAccountKind string = 'StorageV2'

@description('Storage Acount Description-parameters in the parameters file')
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageName
  location: storageRegion
  sku: { name: storageSku //tier is a read only property for sku
  }
  kind: 'StorageV2'
}
