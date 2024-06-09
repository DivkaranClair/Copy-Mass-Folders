# Copy Mass Folders Read Me
This PowerShell script automates the process of copying specific folders from a source directory to a destination directory, 
and then deletes the folders from the source directory once they have been successfully copied. The folder names to be 
processed are read from a file named name.txt.

Requirements
Ensure name.txt contains the list of folder names, each on a new line.
Place name.txt in the same directory as the script or provide the full path to name.txt.

Running the Script

To execute the script, open PowerShell, navigate to the directory containing the script, and run:

.\YourScriptName.ps1

Replace YourScriptName.ps1 with the actual name of your PowerShell script file.

If the name.txt file does not have leading or trailing spaces in the names, you can remove the line that trims the whitespace 
from the folder names in the script.
Remove line 7: $folderNameToMove = $folderNameToMove.Trim()