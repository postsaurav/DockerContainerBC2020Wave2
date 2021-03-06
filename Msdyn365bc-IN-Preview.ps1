$containerName = 'bc17india'
$credential = Get-Credential -Message 'Using UserPassword authentication. Please enter credentials for the container.'
$auth = 'UserPassword'
$artifactUrl = Get-BCArtifactUrl -storageAccount bcpublicpreview -country in -select Latest -type Sandbox
New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -multitenant:$false `
    -assignPremiumPlan `
    -memoryLimit 4G `
    -vsixFile (Get-LatestAlLanguageExtensionUrl) `
    -updateHosts
