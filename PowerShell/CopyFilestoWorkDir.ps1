#Script to copy data to working locations 
#$source is the path to the inflated PoliceData
$source = "path to source file"

#the following are the desired paths copy Street level, Stopand Search and Outcome inflated files to post pattern matching 
$streetdata = "path to source file/Street"
$searchdata = "path to source file/StopandSearch"
$outcomesdata = "path to source file/Outcomes"

#Pattern matching and copy
$folders = Get-ChildItem -Path $source
foreach ($folder in $folders) {
Get-ChildItem -Path $folder | Where-Object Name -like *street.csv | Copy-Item -Destination $streetdata
    }
foreach ($folder in $folders) {
    Get-ChildItem -Path $folder | Where-Object Name -like *search.csv | Copy-Item -Destination $searchdata
    }
foreach ($folder in $folders) {
    Get-ChildItem -Path $folder | Where-Object Name -like *outcomes.csv | Copy-Item -Destination $outcomesdata
   }