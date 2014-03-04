@echo off
setlocal

call winrm id | find "Stack: 1"
if "%ERRORLEVEL%"=="0" (
  echo Your winrm version is too smaller. Please intall 2.0 or greator.
  echo http://search.microsoft.com/en-us/DownloadResults.aspx?q=winrm
  exit /b 1
)

call winrm qc
call winrm set winrm/config/client/auth @{Basic="true"}
call winrm set winrm/config/service/auth @{Basic="true"}
call winrm set winrm/config/service @{AllowUnencrypted="true"}
sc config WinRM start= auto

call winrm get winrm/config/service
