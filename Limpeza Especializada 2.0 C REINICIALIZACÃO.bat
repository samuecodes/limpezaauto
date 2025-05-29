@echo off
color 05
cls
echo.
echo  ================================================
echo         LIMPEZA AVANCADA DO WINDOWS
echo          Desenvolvido por @_Sam.xz
echo  ================================================
echo.
echo           Pressione Enter para iniciar
pause >nul
cls

echo [1/11] Limpando arquivos temporários do usuário...
del /s /f /q "%temp%\*.*"
rd /s /q "%temp%"

echo [2/11] Limpando arquivos temporários do sistema...
del /s /f /q "C:\Windows\Temp\*.*"
rd /s /q "C:\Windows\Temp"

echo [3/11] Limpando cache do Microsoft Edge...
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"

echo [4/11] Limpando cache do Google Chrome...
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"

echo [5/11] Limpando cache do Mozilla Firefox...
for /d %%x in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
    rd /s /q "%%x\cache2"
)

echo [6/11] Limpando cache do Windows Update...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution\Download"
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

echo [7/11] Limpando arquivos de log...
del /s /f /q "C:\Windows\Logs\*.*"

echo [8/11] Limpando Prefetch...
del /s /f /q "C:\Windows\Prefetch\*.*"

echo [9/11] Limpando cache do Explorer e DNS...
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*"
ipconfig /flushdns

echo [10/11] Liberando espaço com o Liberador de Espaço em Disco...
cleanmgr /sagerun:1


echo [11/11] Tudo limpo. Reiniciando o sistema em 10 segundos...
timeout /t 10 /nobreak >nul
shutdown /r /t 0