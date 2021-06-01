# Clear temporary files in windows 

This code works on powershell.

##In order to make executable powershell script we need to allow below persmission.
```
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```


## To clear temporary internet files
```
$tempfolders = @(“C:\Windows\Temp\*”, “C:\Windows\Prefetch\*”, “C:\Users\*\Appdata\Local\Temp\*”)
Remove-Item $tempfolders -force -recurse
```
## To empty recycle bin
### Solution 1
```
Get-ChildItem -Path 'C:\$Recycle.Bin' -Force | Remove-Item -Recurse -ErrorAction SilentlyContinue
```

### Solution 2
```
$recycleBin = (New-Object -ComObject Shell.Application).NameSpace(0xa)
$recycleBin.Items() | ForEach-Object -Process { Remove-Item -Path $_.Path -Force -Recurse }
```

### Solution 3 (PowerShell v5)
```
Clear-RecycleBin -Force
```