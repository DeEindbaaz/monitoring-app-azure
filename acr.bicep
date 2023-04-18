param name string
param location string

@allowed([
'Basic'
'Standard'
'Premium'
])
@description('Defaults to Standard')
param sku string = 'Standard'

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

resource MonitoringAppAzureRepo123 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
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

output name string = MonitoringAppAzureRepo123.name
