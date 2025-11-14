#!/bin/bash

# --- 1. ACTUALIZAR PAQUETES ---
echo "Actualizando índices de paquetes..."
sudo apt update -y
echo "Actualización completada."
echo

# --- 2. INSTALAR APACHE2 ---
echo "Instalando Apache2..."
sudo apt install apache2 -y
# Iniciar y habilitar Apache2 (si no está ya habilitado por defecto)
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Apache2 instalado y corriendo."
echo

# --- 3. INSTALAR MARIADB (O MySQL) ---
# MariaDB es a menudo el reemplazo predeterminado de MySQL en Ubuntu
echo "Instalando MariaDB Server..."
sudo apt install mariadb-server -y
# Iniciar y habilitar MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo "MariaDB Server instalado y corriendo."
echo

# --- 4. INSTALAR PHP Y MÓDULOS COMUNES ---
# Incluye el módulo de PHP para Apache y el conector de MySQL
echo "Instalando PHP y módulos esenciales..."
sudo apt install php libapache2-mod-php php-mysql php-cli -y
echo "PHP y módulos instalados."
echo

# --- 5. CONFIGURACIÓN BÁSICA DE PHP (OPCIONAL) ---
# Crear un archivo de prueba 'info.php' para verificar la instalación de PHP
echo "Creando archivo de prueba info.php..."
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php > /dev/null
echo "Archivo info.php creado en /var/www/html/"
echo

# --- 6. REINICIAR APACHE PARA APLICAR CAMBIOS DE PHP ---
echo "Reiniciando Apache2 para habilitar PHP..."
sudo systemctl restart apache2
echo "Instalación LAMP completada!"
