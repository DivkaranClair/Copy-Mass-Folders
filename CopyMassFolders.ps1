$sourceDirectory = "C:\Users\Administrator\Desktop\1"
$destinationDirectory = "C:\Users\Administrator\Desktop\2"
$folderNamesToMove = Get-Content "C:\Users\Administrator\Desktop\name.txt"
foreach ($folderNameToMove in $folderNamesToMove) {
    $folderNameToMove = $folderNameToMove.Trim()
    $sourcePath = Join-Path -Path $sourceDirectory -ChildPath $folderNameToMove
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $folderNameToMove
    if (Test-Path -Path $sourcePath) {
        if (-not (Test-Path -Path $destinationPath)) {
            try {
                Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
                Write-Output "Folder '$folderNameToMove' has been copied to '$destinationDirectory'."
                Remove-Item -Path $sourcePath -Force -Recurse
                Write-Output "Folder '$folderNameToMove' has been deleted from '$sourceDirectory'."
            } catch {
                Write-Output "Failed to copy folder '$folderNameToMove': $_"
            } finally {
                Write-Output "Operation for folder '$folderNameToMove' completed."
            }
        } else {
            Write-Output "Folder '$folderNameToMove' already exists in '$destinationDirectory'."
        }
    } else {
        Write-Output "Folder '$folderNameToMove' does not exist in '$sourceDirectory'."
    }
}