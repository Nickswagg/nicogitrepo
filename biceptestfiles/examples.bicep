// Example-only template demonstrating Bicep variables, data types, and outputs.
// It does not create Azure resources.

type DeploymentMetadata = {
  environment: string
  owner: string
  isProduction: bool
}

// Variables infer their types from the assigned values.
var applicationName = 'sample-app' // string
var replicaCount = 3 // int
var diagnosticsEnabled = true // bool
var allowedRegions = [
  'eastus'
  'westus2'
] // array of strings
var deploymentMetadata = {
  environment: 'development'
  owner: 'platform-team'
  isProduction: false
} // object

// Outputs make values available to the caller of the deployment.
output appName string = applicationName
output instances int = replicaCount
output diagnostics bool = diagnosticsEnabled
output regions string[] = allowedRegions
output metadata DeploymentMetadata = deploymentMetadata
