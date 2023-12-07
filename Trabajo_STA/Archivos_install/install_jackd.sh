#!/bin/bash

# Descargar el archivo tar.gz de Jack
#git clone https://github.com/jackaudio/jack2

# Entrar al directorio recién creado
cd jack2

# Instalar dependecias del sistema
sudo apt-get update

sudo apt-get install -y libopus-dev portaudio19-dev libasound2-dev libffado-dev libgtkmm-2.4-dev libeigen3-dev
# Configurar e instalar Jack
./waf configure
./waf build
sudo ./waf install

# Configura JACK para habilitar soporte ALSA y PortAudio
sudo cp build/jackd ~/.jackdrc
echo "driver alsa" | sudo tee -a ~/.jackdrc
echo "driver real_time 1" | sudo tee -a ~/.jackdrc
echo "driver seq" | sudo tee -a ~/.jackdrc
echo "realtime-priority 99" | sudo tee -a ~/.jackdrc
echo "realtime" | sudo tee -a ~/.jackdrc
echo "softmode" | sudo tee -a ~/.jackdrc

# Limpia los archivos temporales
cd ..
rm -rf jack2

# Configura el límite de archivos para permitir la ejecución en tiempo real
echo "@audio   -  rtprio     99" | sudo tee -a /etc/security/limits.conf
echo "@audio   -  memlock    unlimited" | sudo tee -a /etc/security/limits.conf

# Configura el kernel para permitir el acceso en tiempo real
sudo echo "snd-aloop" | sudo tee -a /etc/modules
echo "options snd-aloop index=0 pcm_substreams=2" | sudo tee -a /etc/modprobe.d/alsa-loopback.conf
sudo update-initramfs -u

usermod -a -G audio dit

jackd --version
sudo apt-get install qjackctl
