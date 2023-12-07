#!/bin/bash

# Obtener el directorio actual
directorio_actual="$(pwd)"

# Descomprimir el archivo en el directorio actual
tar -xvzf chuck-1.5.1.8.tgz

# Verificar si la descompresión fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: No se pudo descomprimir chuck-1.5.1.8.tgz"
    exit 1
fi

# Ingresar al directorio de ChucK
cd "$directorio_actual/chuck-1.5.1.8"

# Verificar si el directorio existe
if [ ! -d "$directorio_actual/chuck-1.5.1.8" ]; then
    echo "Error: El directorio chuck-1.5.1.8 no existe"
    exit 1
fi

# Instalar dependencias
sudo apt install -y build-essential bison flex libsndfile1-dev \
  libasound2-dev libpulse-dev libjack-jackd2-dev

# Ingresar al directorio de código fuente de ChucK
cd src

# Compilar ChucK para Linux
make linux

# Verificar si la compilación fue exitosa
if [ $? -ne 0 ]; then
    echo "Error: La compilación de ChucK no fue exitosa"
    exit 1
fi

# Mostrar la versión de ChucK
./chuck --version

echo "Instalación de ChucK completada exitosamente."
