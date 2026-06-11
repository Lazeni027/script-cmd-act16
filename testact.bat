@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Veuillez executer ce script en tant qu'Administrateur.
    echo Cliquez droit sur le fichier -^> Executer en tant qu'administrateur
    pause
    exit /b
)

if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" (
    cd "C:\Program Files\Microsoft Office\Office16"
) else if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" (
    cd "C:\Program Files (x86)\Microsoft Office\Office16"
) else (
    echo Microsoft Office 16 n'a pas ete trouve sur ce PC.
    echo Veuillez verifier l'installation.
    pause
    exit /b
)

echo Installation de la nouvelle cle...
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99

echo.
echo Activation de la licence...
cscript ospp.vbs /act

echo.
echo Verification de l'etat d'activation...
cscript ospp.vbs /dstatus

echo.
echo Activation terminee.
pause