param(
    [Parameter(Mandatory=$false)]
    [string]$Branch = "main"
)

# Hardcoded repository name
$TemplateRepo = "poesterlin/sveltekit-starter"

# Function to check if git is installed
function Test-GitInstalled {
    try {
        git --version | Out-Null
        return $true
    }
    catch {
        Write-Error "Git is not installed. Please install Git and try again."
        return $false
    }
}

# Check if git is installed
if (-not (Test-GitInstalled)) {
    exit 1
}

# Download the template repository
Write-Host "Downloading template from $TemplateRepo..."
try {
    # Download and extract the repository
    $tempZip = Join-Path $env:TEMP "temp_repo.zip"
    Invoke-WebRequest "https://github.com/$TemplateRepo/archive/refs/heads/$Branch.zip" -OutFile $tempZip
    Expand-Archive -Path $tempZip -DestinationPath $env:TEMP -Force
    
    # Get the extracted folder name
    $repoName = ($TemplateRepo -split '/')[-1]
    $extractedPath = Join-Path $env:TEMP "$repoName-$Branch"
    
    # Copy contents to current directory
    Copy-Item -Path "$extractedPath\*" -Destination . -Recurse -Force
    
    # Clean up temporary files
    Remove-Item -Path $tempZip -Force
    Remove-Item -Path $extractedPath -Recurse -Force
    
    # Initialize new git repository
    Write-Host "Initializing new git repository..."
    git init

    # remove script
    Remove-Item -Path $MyInvocation.MyCommand.Path -Force

    git add .
    git commit -m "Initial setup from template"
    
    Write-Host "Template setup complete! New repository initialized."

    # copy .env.example to .env
    Copy-Item -Path .env.example -Destination .env -Force

    # install dependencies
    bun install
}
catch {
    Write-Error "An error occurred: $_"
    exit 1
}
