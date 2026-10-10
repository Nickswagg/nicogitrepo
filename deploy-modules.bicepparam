using './deploy-modules.bicep'

// Replace these examples with names that are globally unique across Azure.
param storageAccountNames = [
  'nicostorage001'
  'nicostorage002'
  'nicostorage003'
  'nicostorage004'
  'nicostorage005'
]

param vmName = 'nicosamplevm'
param adminUsername = 'azureadmin'

// Set the ADMIN_PASSWORD environment variable before building or deploying.
param adminPassword = readEnvironmentVariable('ADMIN_PASSWORD', '')

// Replace with your public IP address in CIDR notation, such as 198.51.100.25/32.
param rdpSourceAddressPrefix = '198.51.100.25/32'

param location = 'eastus'
