<#
    $ENV:PSU_Connections__0__Url = 'http://localhost:5000'
    $ENV:PSU_Connections__0__Hub = 'Linux'
#>

Invoke-PSUCommand -Command "New-Item" -Parameters @{
    Path = "/usr/share/$(Get-Random).txt"
    ItemType = 'File'
} -Hub Linux