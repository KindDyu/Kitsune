@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
title Kitsune

:: Cores ANSI
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "VERMELHO=%ESC%[31m"
set "VERDE=%ESC%[32m"
set "AMARELO=%ESC%[33m"
set "AZUL=%ESC%[34m"
set "MAGENTA=%ESC%[35m"
set "CIANO=%ESC%[36m"
set "BRANCO=%ESC%[37m"
set "REDEFINIR=%ESC%[0m"

:: Configuração padrão
set qualidade=3
set dublagem=0
set tipo=1

:MENU
cls & call :MSG_KITSUNE
echo     :: Configurar antes de baixar
echo.

echo     %CIANO%Tipo de download%REDEFINIR%

:: Determinar tipo de download
if !tipo!==0 set "td=Áudio"
if !tipo!==1 set "td=Vídeo"
if !tipo!==2 set "td=Imagem"

echo     [ 1 ] !td!
echo.

:: Mostrar opções se for somente tipo vídeo
if !tipo!==1 (
echo     %CIANO%Preferência de formato%REDEFINIR%

:: Lógica de qualidades
if !qualidade!==0 set "qv=Melhor qualidade"
if !qualidade!==1 set "qv=2160p"
if !qualidade!==2 set "qv=1440p"
if !qualidade!==3 set "qv=1080p"
if !qualidade!==4 set "qv=720p"
if !qualidade!==5 set "qv=480p"
if !qualidade!==6 set "qv=360p"
if !qualidade!==7 set "qv=240p"
if !qualidade!==8 set "qv=144p"

echo     [ Q ] Qualidade do vídeo		[ %CIANO%!qv!%REDEFINIR% ]
if !dublagem!==1 (echo     [ D ] Dublagem                      [ %VERDE%SIM%REDEFINIR% ]) else (echo     [ D ] Dublagem                      [ %VERMELHO%NÃO%REDEFINIR% ])
echo.
)

echo     %CIANO%Ações%REDEFINIR%
echo     [ U ] %VERDE%↻ Atualizar ferramentas%REDEFINIR%
echo     [ B ] %VERDE%→ Baixar%REDEFINIR%
echo     [ S ] %VERMELHO%✕ Sair%REDEFINIR%
echo.
set /p "choice=Escolha uma opção: "

:: Validar entrada vazia
if /I "!choice!"=="" goto MENU

:: Seleção do tipo de download
if /I "!choice!"=="1" (
	set /a tipo+=1
	if !tipo! GTR 2 set tipo=0
	goto MENU
)

:: Seleção de qualidade
if /I "!choice!"=="Q" (
	set /a qualidade+=1
	if !qualidade! GTR 8 set qualidade=0
	goto MENU
)

:: Escolher se deseja Dublagem
if /I "!choice!"=="D" (
	if !dublagem!==1 (set dublagem=0) else (set dublagem=1)
	goto MENU
)

:: Atualizar ferramentas
if /I "!choice!"=="U" (
	echo.
	:: Atualizar yt-dlp.exe
	yt-dlp.exe -U

	echo.
	:: Atualizar gallery-dl.exe
	gallery-dl.exe -U

	echo. & pause & goto MENU
)

if /I "!choice!"=="B" goto BAIXAR
if /I "!choice!"=="S" exit /b

goto MENU

:BAIXAR
cls & call :MSG_KITSUNE
set "URL="
set /p "URL=Adicione o link (ou pressione Enter para voltar): "

if "!URL!"=="" (
	echo %VERMELHO%[ERRO] %REDEFINIR%URL não pode estar vazia.
	echo. & pause & goto MENU
)

:ARGUMENTOS
set "ARGUMENTOS="
set "FORMATO="

:: Áudio
if !tipo!==0 (
	set "ARGUMENTOS=-x --audio-format mp3"
	set "FORMATO=ba/b"
)

:: Vídeo
if !tipo!==1 (
    if !dublagem!==1 (
        :: Qualidade com dublagem em PT
        if !qualidade!==0 (
            set "FORMATO=bestvideo[vcodec^=avc1][language^=pt]+bestaudio[language=pt]/best[language=pt]"
        ) else (
            set "FORMATO=bestvideo[vcodec^=avc1][height<=!qv!][language^=pt]+bestaudio[language=pt]/best[height<=!qv!][language=pt]"
        )
    ) else (
        :: Qualidade com melhor áudio disponível
        if !qualidade!==0 (
            set "FORMATO=bv*+ba/b"
        ) else (
            set "FORMATO=bv*[height<=!qv!]+ba/b"
        )
    )
)

echo.
call :MSG_INFO

if !tipo!==2 (
	echo	%CIANO%Comando:%REDEFINIR% gallery-dl.exe "!URL!"
	echo.

	:: Execução do comando
	gallery-dl.exe  "!URL!"

) else (
	echo	%CIANO%Comando:%REDEFINIR% yt-dlp.exe !ARGUMENTOS! -f "!FORMATO!" "!URL!"
	echo.

	:: Execução do comando
	yt-dlp.exe !ARGUMENTOS! -f "!FORMATO!" "!URL!"
)

echo.
call :MSG_INFO
call :MSG_ERRORLEVEL
echo. & pause & goto MENU

:: Arte ANSI Shadow
:MSG_KITSUNE
echo. %CIANO%
echo   ██╗  ██╗██╗████████╗███████╗██╗   ██╗███╗   ██╗███████╗
echo   ██║ ██╔╝██║╚══██╔══╝██╔════╝██║   ██║████╗  ██║██╔════╝
echo   █████╔╝ ██║   ██║   ███████╗██║   ██║██╔██╗ ██║█████╗
echo   ██╔═██╗ ██║   ██║   ╚════██║██║   ██║██║╚██╗██║██╔══╝
echo   ██║  ██╗██║   ██║   ███████║╚██████╔╝██║ ╚████║███████╗
echo   ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
echo.
echo ───────────────────────────────────────────────────────────
echo. %REDEFINIR%
goto :EOF

:MSG_INFO
echo %AMARELO%[INFO]%REDEFINIR%
goto :EOF

:MSG_ERRORLEVEL
if %errorlevel% equ 0 (
    echo %VERDE%[SUCESSO]%REDEFINIR%
) else (
    echo %VERMELHO%[ERRO]%REDEFINIR%
)
goto :EOF
