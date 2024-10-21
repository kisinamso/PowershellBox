Get-WinEvent -LogName "Microsoft-Windows-FailoverClustering/Operational" -MaxEvents 100 | Where-Object {$_.Id -eq 1641} 
