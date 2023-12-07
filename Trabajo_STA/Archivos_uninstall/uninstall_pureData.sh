#!/bin/bash

# Navegar al directorio donde este el directorio pure-data

# Desinstalar Pure Data
sudo make uninstall

# Limpiar archivos temporales
cd ..
rm -rf pure-data

echo "Pure Data desinstalado con éxito."
