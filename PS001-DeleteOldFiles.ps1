########################################@kisinamso########################################
#If you want to delete files which older specific day in a path you can use this script. #
########################################@kisinamso########################################

# Prompt user for the location to scan
$location = Read-Host "D\"

# Prompt user for the duration (older than how many days)
$days = Read-Host "7"

# Prompt user for the action (1 for delete, 2 for do nothing)
$action = Read-Host "1"

# Calculate the cutoff date
$cutoffDate = (Get-Date).AddDays(-$days)

# Find files and folders older than the specified duration
$oldItems = Get-ChildItem -Path $location -Recurse | Where-Object { $_.LastWriteTime -lt $cutoffDate }

# Take action based on user's choice
if ($action -eq "1") {
    $oldItems | ForEach-Object {
        if ($_.PSIsContainer) {
            Write-Host "Deleting folder: $($_.FullName)"
            Remove-Item $_.FullName -Recurse -Force
        } else {
            Write-Host "Deleting file: $($_.FullName)"
            Remove-Item $_.FullName -Force
        }
    }
} elseif ($action -eq "2") {
    Write-Host "No action taken. Here are the items older than $days days:"
    $oldItems | ForEach-Object { Write-Host $_.FullName }
} else {
    Write-Host "Invalid action selected."
}
