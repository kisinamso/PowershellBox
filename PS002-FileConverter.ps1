########################################@kisinamso########################################
#If you want to convert specific files extension in a path you can use this script.      #
########################################@kisinamso########################################
#Let's we convert from sql to txt
$path = "C:\Users\user\Desktop"

$files = Get-ChildItem -Path $path -Filter *.sql -Recurse

foreach ($file in $files) {
    $newFileName = [System.IO.Path]::ChangeExtension($file.Name, ".txt")

    $file | Rename-Item -NewName $newFileName -Force
    Write-Host "File Converted : $newFileName"
}

Write-Host "Converting is done."
