
#!/bin/bash

# Detener ChucK si está en ejecución
pkill chuck

# Regresar al directorio donde se encuentra la carpeta chuck-1.5.1.8 y elimala.
sudo rm -r chuck-1.5.1.8

# Desinstalar dependencias (puedes ajustar esto según tus necesidades)
sudo apt remove --purge build-essential bison flex libsndfile1-dev \
  libasound2-dev libpulse-dev libjack-jackd2-dev

# Limpiar dependencias no utilizadas
sudo apt autoremove

# Eliminar paquetes que podrían haber sido instalados automáticamente y ya no son necesarios
sudo apt-get autoremove --purge

# Actualizar el sistema para aplicar los cambios
sudo apt update
sudo apt upgrade

echo "ChucK desinstalado exitosamente."
