using './main.bicep'

// Replace this example with a globally unique name (3–24 lowercase letters/numbers).
param storageAccountName = 'nicostorageacct123'
param storageAccountType = 'Standard_LRS'
// location defaults to the resource group's location in main.bicep.


// Virtaul Machine parameters
param vmName = 'NicoVM'
param vmSize = 'Standard_D2als_v7'
