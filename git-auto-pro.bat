@echo off
:menu
echo ============================
echo   SCRIPT GIT AUTOMATIQUE PRO
echo ============================
echo 1. Voir fichiers modifiés + push
echo 2. Récupérer depuis GitHub (pull)
echo 3. Quitter
echo ============================
set /p choix=Choix :

if "%choix%"=="1" goto push
if "%choix%"=="2" goto pull
if "%choix%"=="3" exit
goto menu

:push
echo Voici la liste des fichiers modifiés :
git status --short
echo.
set /p confirm=Veux-tu continuer le commit et push ? (O/N) :
if /i "%confirm%" NEQ "O" (
    echo Commit annulé.
    pause
    goto menu
)
set /p msg=Message du commit :
git add .
git commit -m "%msg%"
git push
pause
goto menu

:pull
git pull
pause
goto menu
