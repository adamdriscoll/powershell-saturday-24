[int]$Count = Read-Host "How many should we process?"

1..$Count | ForEach-Object {
    Write-Progress -Activity "Processing" -PercentComplete $_
    Start-Sleep -Milliseconds 100
}

Wait-Debugger