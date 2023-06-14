# Auto-elevate
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$([string]$Args)`"" -Verb RunAs ; exit }

$csgo_process = Get-Process -Name csgo
if ($csgo_process) {
    $csgo_process.ProcessorAffinity = 65532
    $csgo_process.PriorityClass = "RealTime"
}

# Write-Host "`n"
# cmd /c 'pause>nul | echo [*] Fim! Pressione qualquer tecla para Sair...'
