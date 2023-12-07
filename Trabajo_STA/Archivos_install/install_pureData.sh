
sudo apt-get update
sudo apt-get install build-essential tcl tk
sudo apt-get install libasound2-dev

git clone https://github.com/pure-data/pure-data.git
cd pure-data

# Configurar e instalar Pure Data
./autogen.sh
./configure --enable-jack
make
sudo make install

pd --version

echo "Pure Data instalado con éxito."
