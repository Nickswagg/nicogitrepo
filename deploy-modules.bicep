@description('Exactly five globally unique storage account names (3-24 lowercase letters and numbers each).')
@minLength(5)
@maxLength(5)
param storageAccountNames string[]

@description('Name of the Windows virtual machine. Use 15 characters or fewer.')
@maxLength(15)
param vmName string

@description('Administrator username for the Windows virtual machine.')
param adminUsername string = 'azureadmin'

@description('Strong administrator password for the Windows virtual machine.')
@secure()
param adminPassword string

@description('CIDR range allowed to connect over RDP, for example your public IP followed by /32.')
param rdpSourceAddressPrefix string

@description('Azure region for both modules.')
param location string = resourceGroup().location

module storageAccounts './modules/storage-account.bicep' = [for storageAccountName in storageAccountNames: {
  params: {
    storageAccountName: storageAccountName
    location: location
  }
}]

module virtualMachine './modules/virtual-machine.bicep' = {
  params: {
    vmName: vmName
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    rdpSourceAddressPrefix: rdpSourceAddressPrefix
  }
}

output storageAccountResults object[] = [for i in range(0, length(storageAccountNames)): {
  id: storageAccounts[i].outputs.storageAccountId
  name: storageAccounts[i].outputs.storageAccountName
}]

output deploymentResult object = {
  virtualMachineId: virtualMachine.outputs.virtualMachineId
  virtualMachineName: virtualMachine.outputs.virtualMachineName
  publicIpAddress: virtualMachine.outputs.publicIpAddress
}
