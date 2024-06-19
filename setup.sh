#!/bin/bash

echo ""
echo "--- Iniciando instalacao do ambiente de desenvolvimento by [ NHLJ ] ---"

clear && sleep 2
echo ""
echo "--- Atualizando lista de pacotes ---"
sudo apt -y update

echo ""
echo "--- Atualizando o sistema ---"
sudo apt -y full-upgrade

echo ""
echo "--- Instalando pacotes basicos para desenvolvimento ---"
sudo apt -y install vim software-properties-common vim curl git binutils cpp flex gcc libarchive-zip-perl lynx m4 make ncftp nmap openssl unzip zip zlib1g-dev autoconf libtool bison autotools-dev g++ build-essential bzip2 

echo ""
echo "--- Instalando pacotes de rede ---"
sudo apt -y install net-tools tcpdump iptraf-ng sysv-rc-conf debconf-utils libncurses5-dev bwm-ng iftop tcptrack dstat ifstat nload htop

echo ""
echo "[OK] --- Ambiente de desenvolvimento concluido ---"

# Instale apartir daqui o que você desejar 
echo ""
sudo apt -y install wget curl unzip software-properties-common gnupg2

sudo apt -y install postgresql-client

sudo apt -y  install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev pkg-config



echo ""
echo "Preparando ambiente Docker e Docker Compose"
sudo su -
apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common jq bash-completion
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
apt update
apt -y install docker-ce docker-ce-cli containerd.io docker-compose

echo ""
echo "Criarndo grupo e usuario docker e adicionando usuario ao grupo"
sudo usermod -aG docker vagrant

docker system info

echo ""
echo "Executanto update novamente"
sudo apt update
sudo apt upgrade -y

echo ""
echo "Instalando bibliotecas para posterior instalação do Python 3.12.4"
sudo apt install -y wget build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev libffi-dev libgdbm-compat-dev

sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git

echo ""
echo ""
echo "-----"
echo "Instalando Python 3.12.4"
cd /home/vagrant
wget https://www.python.org/ftp/python/3.12.4/Python-3.12.4.tgz
tar xzvf Python-3.12.4.tgz
cd Python-3.12.4/
./configure --enable-optimizations
make -j $(nproc)
sudo make altinstall
cd /home/vagrant && echo "alias python3=python3.12" >> .bashrc && source .bashrc

echo ""
echo ""
echo "-----"
echo "Instalando Pip para o Python3.12.4"
cd /home/vagrant
wget https://bootstrap.pypa.io/get-pip.py && /usr/local/bin/python3.12 get-pip.py

echo ""
echo ""
echo "-----"
echo "Verificando versão do Pip e do Python instalados"
python3 -m pip --version
python3 --version

rm get-pip.py
rm Python-3.12.4.tgz
sudo rm -rf Python-3.12.4

echo ""
echo ""
echo "-----"
echo "Instalando o gh para criar repositórios no github"
sudo apt install gh -y

echo ""
echo ""
echo "-----"
echo "Instalando o ignr"
pip install ignr

echo ""
echo ""
echo "-----"
echo "Instalando o httpie"
/usr/local/bin/python3.12 -m pip install --upgrade pip wheel
/usr/local/bin/python3.12 -m pip install --upgrade httpie