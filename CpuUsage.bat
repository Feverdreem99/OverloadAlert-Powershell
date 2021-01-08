@echo off
cls
:chktemp
set threshold=80
for /f "tokens=*" %%f in ('wmic cpu get loadpercentage /value ^| find "="') do set "%%f"
if %loadpercentage% GTR %threshold% Powershell.exe -executionpolicy remotesigned -File  F:\Documentos\CpuAlert.ps1
goto standby

:standby
timeout /t 15
goto chktemp