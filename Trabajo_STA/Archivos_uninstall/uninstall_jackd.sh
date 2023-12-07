#!/bin/bash

# Cambia al directorio de la fuente de Jack
directorio_actual ="$PWD"
cd directorio_actual/jack2

#Borrar dependencias
sudo apt-get remove --purge -y libopus-dev portaudio19-dev libasound2-dev libffado-dev libgtkmm-2.4-dev libeigen3-dev 

# Desinstala Jack
./waf uninstall
cd ..
# Borra los archivos de la instalación
sudo rm -rf jack2

# Deshacer cambios en límites de archivos y configuración del kernel
sudo sed -i '/@audio   -  rtprio     99/d' /etc/security/limits.conf
sudo sed -i '/@audio   -  memlock    unlimited/d' /etc/security/limits.conf
sudo sed -i '/snd-aloop/d' /etc/modules
sudo rm -f /etc/modprobe.d/alsa-loopback.conf
sudo update-initramfs -u

# Eliminar usuario del grupo 'audio'
sudo deluser grvc audio

echo "Configuraciones de límites y kernel deshechas."

echo "Jack desinstalado correctamente."
