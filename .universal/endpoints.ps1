New-PSUEndpoint -Url "/api/user" -Description "Returns all user accounts. " -Method @('GET') -Endpoint {
    Get-LocalUser
} -Documentation "User API" 
New-PSUEndpoint -Url "/api/user/:username" -Description "Returns a user by username. " -Method @('GET') -Endpoint {
    param(
        [Parameter(Mandatory, HelpMessage = "The username to return")]
        $username
    )

    Get-LocalUser -Name $Username
} -Documentation "User API" 
New-PSUEndpoint -Url "/api/process" -Description "Starts a new process on the server. " -Method @('POST') -Endpoint {
    param(
        [Parameter(Mandatory)]
        $Name
    )

    <# 
Invoke-RestMethod http://localhost:5000/api/process -Body (@{ Name = "Notepad"} | ConvertTo-Json) -ContentType 'application/json' -Headers @{
  Authorization = "Bearer $AppToken"
} -Method POST
#>

    Start-Process $Name -PassThru | Select-Object Name, Id
} -Authentication -Role @('Administrator') 
New-PSUEndpoint -Url "/api/image/flip" -Description "Flips an image. " -Method @('PUT') -Endpoint {
    <#
    Invoke-WebRequest http://localhost:5000/api/image/flip -InFile 'C:\ProgramData\UniversalAutomation\Repository\powershell.png' -Method PUT -OutFile "$($ENV:USERPROFILE)\OneDrive\Desktop\shellpower.png"
#>

    $Stream = [System.IO.MemoryStream]::new($Data)
    $Image = [System.Drawing.Image]::FromStream($Stream)

    $Image.RotateFlip('RotateNoneFlipY')
    $NewStream = [System.IO.MemoryStream]::new()
    $Image.Save($NewStream, 'Png')

    #$NewStream.Length

    New-PSUApiResponse -ContentType 'image/png' -Data ($NewStream.ToArray())
}