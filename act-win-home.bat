@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Veuillez executer ce script en tant qu'Administrateur.
    pause
    exit /b
)

echo Edition Windows installee :
wmic os get caption
echo.

echo ========================================
echo Tentative d'activation...
echo ========================================
echo.

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
echo.
slmgr /skms kms.digiboy.ir:1688
echo.
slmgr /ato
echo.
slmgr /dli

pause