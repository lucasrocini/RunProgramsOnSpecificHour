# Autor: Lucas Rocini
# Versao: LAR 1.0
# Emai: lucasrocini@hotmail.com

# Script para sincronizar arquivos (PC de exibição de slides)

#@echo off

# Matar Processo PowerPoint
taskkill /s PC_Name_or_IP /u nestle\bralvesang /FI "IMAGENAME eq powerpnt.exe" /F
taskkill /s PC_Name_or_IP /u nestle\bralvesang /FI "IMAGENAME eq powerpnt.exe" /F


# Copiar arquivos 
echo .
echo "*******************************"
echo "Copiando Arquivos"
echo "*******************************"
$Source = "C:\Users\" + $env:username + "\Desktop\Arquivos PC\Presentation"
$Destination = "\\PC_Name_or_IP\C$\temp\Presentation"
Robocopy $Source $Destination /MIR

#Reiniciar PC
echo .
echo "*******************************"
echo "Reiniciando o PC"
echo "*******************************"
shutdown -r -f -m \\PC_Name_or_IP -t 10
#Stop-Computer -computerName PC_Name_or_IP

#@echo on
pause
