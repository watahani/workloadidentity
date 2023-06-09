$cred = Get-Content -Path ./credentials.txt | ConvertFrom-Json

$token = Invoke-RestMethod -Uri https://login.microsoftonline.com/$($cred.AadTenantId)/oauth2/token -Method POST -Body @{
    grant_type    = 'client_credentials'
    client_id     = $cred.AadClientId
    client_secret = $cred.AadSecret
    resource      = 'https://management.azure.com/'
}

Write-Host $token.access_token