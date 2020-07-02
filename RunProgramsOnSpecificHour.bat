@ECHO OFF

REM Autor: Lucas Rocini
REM Versao: LAR 1.0
REM Emai: lucasrocini@hotmail.com

::Script para rodar aplicações em períodos específicos

::variaveis flag 
::0 = ha arquivo aberto 
::1 = nao ha arquivo aberto
set file01open=0
set file02open=0
set file03open=0

:loopPrincipal

::hora atual
SET hour=%time:~0,2%

::Horario 01
::se for 0 ou mais horas e menos que 7 horas
IF %hour% GEQ 0 (
	IF %hour% LSS 7 (
		GOTO rodarApresentacao02
	)
)

::Horario 02
::se for 7 ou mais horas e menos que 9 horas
IF %hour% GEQ 7 (
	IF %hour% LSS 9 (
		GOTO rodarApresentacao01
	)
)

::Horario 03
::se for 10 ou mais horas e menos que 24 horas
IF %hour% GEQ 9 (
	IF %hour% LSS 24 (
		GOTO rodarApresentacao02
	)
)


::vai para loopPrincipal
goto loopPrincipal 

:rodarApresentacao01
echo horario 01
::se nao ha file01 aberto
IF %file01open% EQU 0 (
echo dentro do if file 01
taskkill /FI "IMAGENAME eq powerpnt.exe" /F
taskkill /FI "IMAGENAME eq powerpnt.exe" /F
set file02open=0
set file03open=0
::abrir o arquivo como apresentacao
start powerpnt.exe /S "C:\temp\Presentation\Presentation01.pptx"
set file01open=1
)
::vai para delay
goto loopDelay

:rodarApresentacao02
echo horario 02
::se nao ha file01 aberto
IF %file02open% EQU 0 (
echo dentro do if file 02
taskkill /FI "IMAGENAME eq powerpnt.exe" /F
taskkill /FI "IMAGENAME eq powerpnt.exe" /F
set file01open=0
set file03open=0
::abrir o arquivo como apresentacao
start powerpnt.exe /S "C:\temp\Presentation\Presentation02.pptx"
set file02open=1
)
::vai para delay
goto loopDelay


:loopDelay
::4 horas
::@timeout 14400

::1 minuto
@timeout 60

::10 segundos
::@timeout 10

goto loopPrincipal



