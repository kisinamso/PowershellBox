########################################@kisinamso########################################
#Folder clone powershell for Always-On usage.                                            #
#It should be run separately                                                             #
########################################@kisinamso########################################
# First Step

#Appends a txt path to the folders in the Source Directory
$folderList = Get-ChildItem -Path "F:" -Directory -Recurse | Select-Object FullName

$folderList | ForEach-Object {
    $_.FullName | Out-File -Append -FilePath "D:\FolderList.txt"
}

# Second Step
#Creates the folders in the txt file in the target directory
$folderList = Get-Content -Path "D:\FolderList.txt"

foreach ($folderPath in $folderList) {
    $folderPath = $folderPath.Trim()
    if (-not (Test-Path -Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory
    }
}  
