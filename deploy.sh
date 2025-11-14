#!/bin/bash

# --- VARIABLES DE CONFIGURACIÓN ---
# ¡IMPORTANTE! Cambia esta contraseña por una segura
DB_ROOT_PASSWORD="Tu_Contraseña_ROOT_Segura"
DB_APP_PASSWORD="Tu_Contraseña_APP_Segura"
DB_USER="lamp_user"
DB_NAME="practica_iaw"
APP_DIR="/var/www/practica-iaw"
GIT_REPO="https://github.com/josejuansanchez/iaw-practica-lamp.git"
CLONE_DIR="/tmp/iaw-practica-lamp" # Usamos un directorio temporal para clonar

echo "Iniciando despliegue de la pila LAMP y la aplicación..."

# --- 1. INSTALACIÓN DE PAQUETES ---
echo "--- 1. Instalando LAMP y utilidades ---"
sudo apt update -y
sudo apt install apache2 mariadb-server php php-mysql php-cli git -y
sudo systemctl enable apache2
sudo systemctl enable mariadb

# --- 2. DESCARGA Y PREPARACIÓN DE LA APLICACIÓN ---
echo "--- 2. Descargando y preparando la aplicación ---"

# Clonar el repositorio
git clone $GIT_REPO $CLONE_DIR

# Crear el directorio del proyecto y copiar los archivos
sudo mkdir -p $APP_DIR
# Copiamos todos los archivos importantes: código PHP, configuraciones y el archivo SQL
sudo cp -r $CLONE_DIR/src/* $APP_DIR/
sudo cp $CLONE_DIR/db/database.sql $APP_DIR/
# Mover la configuración de phpmyadmin si se instaló después
sudo cp -r $CLONE_DIR/db/config.php $APP_DIR/

# Establecer permisos para Apache
sudo chown -R www-data:www-data $APP_DIR
sudo chmod -R 755 $APP_DIR

# --- 3. CONFIGURACIÓN DE MARIA DB / MYSQL ---
echo "--- 3. Configurando MariaDB y cargando datos ---"

# Ejecutar comandos de MySQL de forma no interactiva (seguridad y creación de usuario/DB)
# Nota: Por simplicidad, usamos sudo mysql y luego comandos SQL
sudo mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');"
sudo mysql -e "CREATE DATABASE $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
sudo mysql -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_APP_PASSWORD';"
sudo mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Importar el archivo SQL (database.sql)
sudo mysql $DB_NAME < $APP_DIR/database.sql

# --- 4. CONFIGURACIÓN DE LA CONEXIÓN PHP ---
echo "--- 4. Configurando credenciales de PHP ---"

# Crea el contenido del archivo config.php con los datos de conexión correctos
CONFIG_CONTENT="<?php
// Datos de conexión a la base de datos
define('DB_HOST', 'localhost');
define('DB_USER', '$DB_USER');
define('DB_PASSWORD', '$DB_APP_PASSWORD');
define('DB_NAME', '$DB_NAME');
?>"
echo "$CONFIG_CONTENT" | sudo tee $APP_DIR/config.php > /dev/null

# --- 5. CONFIGURACIÓN DE APACHE ---
echo "--- 5. Configurando Apache DocumentRoot ---"

# Cambiar el DocumentRoot en el archivo de configuración por defecto
# Usamos 'sed' para reemplazar /var/www/html por el nuevo directorio
sudo sed -i "s|DocumentRoot /var/www/html|DocumentRoot $APP_DIR|g" /etc/apache2/sites-available/000-default.conf

# Asegurar que index.php esté en la lista de índices de directorio (si no lo está por defecto)
sudo a2enmod dir

# Reiniciar Apache para aplicar todos los cambios
sudo systemctl restart apache2

echo "--- Despliegue completado con éxito! ---"

# Limpieza del directorio temporal
sudo rm -rf $CLONE_DIR
