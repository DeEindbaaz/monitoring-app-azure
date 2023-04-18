param acrName string
param location string

resource acr 'Microsoft.ContainerRegistry/registries@2021-11-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: 'Standard'
  }
  adminUserEnabled: false
}
