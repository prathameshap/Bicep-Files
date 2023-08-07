///ADSL V2 Storage Account deplyment without any storage containers with default scope as resource group(Azure default)

//targetScope = 'resourceGroup' //default


@description('Storage account parameters with default values overriden')
param storageAccountName string = 'storageAccountExp'
param storageAccountLocation string = resourceGroup().location
param storageAccountSku string = 'Standard_LRS'
param storageAccountKind string = 'StorageV2'

@description('Storage Acount Description')
resource bicepStorage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: storageAccountLocation
  sku: { name: storageAccountSku //tier is a read only property for sku
  }
  kind: storageAccountKind
}
