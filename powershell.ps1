$CSVFile = ".\prac.csv"
$TfvarsFile = ".\terraform.tfvars"

# Read CSV
$RGData = Import-Csv -Path $CSVFile

# Start output
$output = @()
$output += "resource_groups = {"

# Counter
$i = 1

foreach ($row in $RGData) {

    $output += "  rg$i = {"
    $output += "    name     = `"$($row.RGname)`""
$output += "    location = `"$($row.Location)`""
    $output += "  }"
    $output += ""

    $i++
}

$output += "}"

# Write output file
$output | Set-Content -Path $TfvarsFile -Encoding UTF8

Write-Host "terraform.tfvars generated successfully!"