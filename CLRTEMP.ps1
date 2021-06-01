$tempfolders = @(“C:\Windows\Temp\*”, “C:\Windows\Prefetch\*”, “C:\Users\*\Appdata\Local\Temp\*”)

Remove-Item $tempfolders -force -recurse

#Clear Recycle bin

Clear-RecycleBin -Force

# Solution 1
#Get-ChildItem -Path 'C:\$Recycle.Bin' -Force | Remove-Item -Recurse -ErrorAction SilentlyContinue

# Solution 2
#$recycleBin = (New-Object -ComObject Shell.Application).NameSpace(0xa)
#$recycleBin.Items() | ForEach-Object -Process { Remove-Item -Path $_.Path -Force -Recurse }

# Solution 3 (PowerShell v5)
#Clear-RecycleBin -Force