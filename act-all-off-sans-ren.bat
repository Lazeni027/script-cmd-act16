@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Veuillez executer ce script en tant qu'Administrateur.
    pause
    exit /b
)

:: Détection automatique de la version Office
set "OFFICE_PATH="
set "OFFICE_VERSION="

for %%v in (16 15 14) do (
    if exist "C:\Program Files\Microsoft Office\Office%%v\ospp.vbs" (
        set "OFFICE_PATH=C:\Program Files\Microsoft Office\Office%%v"
        set "OFFICE_VERSION=%%v"
        goto :found
    )
    if exist "C:\Program Files (x86)\Microsoft Office\Office%%v\ospp.vbs" (
        set "OFFICE_PATH=C:\Program Files (x86)\Microsoft Office\Office%%v"
        set "OFFICE_VERSION=%%v"
        goto :found
    )
)

echo Aucune version supportee d'Office trouvee.
pause
exit /b

:found
cd "%OFFICE_PATH%"
echo Version Office detectee : %OFFICE_VERSION%
echo.

:: Clés KMS génériques par version
if "%OFFICE_VERSION%"=="16" set "PRODUCT_KEY=XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99"
if "%OFFICE_VERSION%"=="15" set "PRODUCT_KEY=YC7DK-G2NP3-2QQC3-J6H88-GVGXT"
if "%OFFICE_VERSION%"=="14" set "PRODUCT_KEY=VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB"

echo Installation de la cle...
cscript ospp.vbs /inpkey:%PRODUCT_KEY%

echo.
echo Activation de la licence...
cscript ospp.vbs /act

echo.
echo Verification de l'etat d'activation...
cscript ospp.vbs /dstatus

echo.
echo Activation terminee.
pause