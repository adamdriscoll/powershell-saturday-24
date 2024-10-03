$Items = Get-ChildItem C:\Windows\System32
Set-PSUCache -Key 'Files' -Value $Items -Persist