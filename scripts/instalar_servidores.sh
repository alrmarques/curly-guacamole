#!/bin/bash

# Script para instalação de ferramentas de servidor Web e Banco de Dados no openSUSE

# Verificar se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script precisa ser executado como root. Execute com sudo."
    exit 1
fi

echo "Atualizando repositórios e pacotes..."
zypper refresh
zypper update -y

echo "Instalando Apache2 (servidor Web)..."
zypper install -y apache2

echo "Habilitando o Apache2 para iniciar automaticamente..."
systemctl enable apache2
systemctl start apache2

echo "Instalando MariaDB (Banco de Dados)..."
zypper install -y mariadb

echo "Habilitando MariaDB para iniciar automaticamente..."
systemctl enable mariadb
systemctl start mariadb

echo "Instalando PHP (para integração com Apache)..."
zypper install -y php php-mysqli

echo "Reiniciando o Apache2 para carregar as configurações do PHP..."
systemctl restart apache2

echo "Instalação concluída!"
echo "Verifique o status do Apache2: systemctl status apache2"
echo "Verifique o status do MariaDB: systemctl status mariadb"
