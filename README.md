# Docking Tracker

This PowerShell script provides a simple way to track docking runs with a unique ID, timestamp, and user-defined metadata. It's useful for maintaining logs of molecular docking jobs performed using MOE or any other docking software.

## 🧠 Features

- Automatically generates a unique Docking ID (e.g., `DOCK0001`, `DOCK0002`, …)
- Prompts for custom metadata (e.g., ligand, protein, software used)
- Appends the record to a CSV file with timestamp
- Creates the log file with a header if not already present

## 📂 Output File

The script logs entries into a file called docking-tracker.csv


## 🛠 Usage

1. Launch PowerShell
2. Run the script:

```powershell
.\docking-tracker.ps1

Enter metadata for this docking job (e.g., ligand, protein, software):
