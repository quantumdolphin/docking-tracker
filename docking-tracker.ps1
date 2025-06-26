# docking-tracker.ps1

# Path to the docking tracker CSV file
$dockingTrackerFile = "docking-tracker.csv"

# Function to generate a unique Docking ID (e.g., DOCK0001, DOCK0002...)
function Generate-DockingID {
    if (Test-Path $dockingTrackerFile) {
        $lastLine = Get-Content $dockingTrackerFile | Select-Object -Last 1
        $lastID = $lastLine.Split(",")[0]
        if ($lastID -match "DOCK(\d{4})") {
            $newID = [int]$Matches[1] + 1
            return "DOCK" + $newID.ToString("0000")
        }
    }
    return "DOCK0001"  # Start with DOCK0001 if file doesn't exist or is empty
}

# Generate a new Docking ID
$dockingID = Generate-DockingID

# Prompt user for docking metadata (can be any custom description)
$metadata = Read-Host "Enter metadata for this docking job (e.g., ligand, protein, software)"

# Capture current timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Construct new CSV entry
$newEntry = "$dockingID,$metadata,$timestamp"

# Create file with header if it doesn't exist
if (-Not (Test-Path $dockingTrackerFile)) {
    "DockingID,Metadata,Timestamp" | Out-File -FilePath $dockingTrackerFile -Encoding utf8
}

# Append the new docking entry to the file
$newEntry | Out-File -FilePath $dockingTrackerFile -Append -Encoding utf8

Write-Output "Docking entry added: $newEntry"
