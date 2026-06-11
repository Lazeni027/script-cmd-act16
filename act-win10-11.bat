@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Veuillez executer ce script en tant qu'Administrateur.
    pause
    exit /b
)

echo ========================================
echo Activation Windows
echo ========================================
echo.

echo 1. Installation de la cle...
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

echo.
echo 2. Configuration du serveur KMS...
slmgr /skms kms.digiboy.ir:1688

echo.
echo 3. Activation...
slmgr /ato

echo.
echo 4. Verification...
slmgr /dli

echo.
echo Activation terminee.
pause