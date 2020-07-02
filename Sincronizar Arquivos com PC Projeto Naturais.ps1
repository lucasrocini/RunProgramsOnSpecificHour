# Autor: Lucas Rocini
# Versao: LAR 1.0
# Emai: lucas.rocini@br.nestle.com

# Script para sincronizar arquivos para o projeto Naturais (PC de exibição de slides)

#@echo off

# Matar Processo PowerPoint
taskkill /s BR24-1IUOV74 /u nestle\bralvesang /FI "IMAGENAME eq powerpnt.exe" /F
taskkill /s BR24-1IUOV74 /u nestle\bralvesang /FI "IMAGENAME eq powerpnt.exe" /F


# Copiar arquivos 
echo .
echo "*******************************"
echo "Copiando Arquivos"
echo "*******************************"
$Source = "C:\Users\" + $env:username + "\Desktop\Arquivos PC Projeto Naturais\DPAPresentation"
$Destination = "\\BR24-1IUOV74\C$\temp\DPAPresentation"
Robocopy $Source $Destination /MIR

#Reiniciar PC
echo .
echo "*******************************"
echo "Reiniciando o PC"
echo "*******************************"
shutdown -r -f -m \\BR24-1IUOV74 -t 10
#Stop-Computer -computerName BR24-1IUOV74

#@echo on
pause