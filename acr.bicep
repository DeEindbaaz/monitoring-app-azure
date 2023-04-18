param name string
param location string

@allowed([
  'Basic'
])
@description('Only Basic is allowed')
param sku string = 'Basic'

@allowed([
  'SystemAssigned'
  'UserAssigned'
])
@description('Two options are available: SystemAssigned or UserAssigned')
param managedIdentityType string

@description('Required when managed identity type is set to UserAssigned')
param userAssignedIdentities object = {}

param adminUserEnabled bool = false

param anonymousPullEnabled bool = false

param publicNetworkAccess bool = false

resource monitoring_app_azure_repo 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  identity: {
    type: managedIdentityType
    userAssignedIdentities: managedIdentityType != 'SystemAssigned' ? userAssignedIdentities : null
  }
  properties: {
    adminUserEnabled: adminUserEnabled
    anonymousPullEnabled: anonymousPullEnabled
    publicNetworkAccess: publicNetworkAccess ? 'Enabled' : 'Disabled'
  }
}

output name string = monitoring_app_azure_repo.name
