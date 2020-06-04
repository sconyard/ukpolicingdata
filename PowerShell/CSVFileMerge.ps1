#Script to merge csv files 
#useful to create one import set to a DB, PowerBi or similar

$getFirstLine = $true
$timestamp = Get-Date -Format yy-MM-dd-hh-mm

#Specify path to the source and output directories.  This script will look in the source location and merge all found files to a single file in the output directory appending a timestamp to the file name
get-childItem "path to source" | ForEach-Object {
    $filePath = $_

    $lines = Get-Content $filePath  
    $linesToWrite = switch($getFirstLine) {
           $true  {$lines}
           $false {$lines | Select-Object -Skip 1}

    }

    $getFirstLine = $false
    Add-Content "path to output/-merge-$timestamp.csv" $linesToWrite
    }