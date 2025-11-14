# Asignar IP elástica
Para crear la IP elástica tendremos que ir a direcciones IP elásticas. Una vez dentro pulsaremos la opcion de asignar dirección IP elástica.

<img width="396" height="99" alt="image" src="https://github.com/user-attachments/assets/89614b28-c34b-44cc-87b6-246226b954c9" />

Una vez dentro lo dejaremos como esta ya que no hace falta tocar naday li pulsaremos a asignar

<img width="1628" height="641" alt="image" src="https://github.com/user-attachments/assets/90cd16a5-dded-406f-88e1-20f84050c428" />

Aqui le estamos asignando a la instancia la IP elástica que hemos creado que en este caso la IP es 100.29.222.205. Seleccionaremos nuestra instancia y la IP privada de la instancia.

<img width="1616" height="487" alt="image" src="https://github.com/user-attachments/assets/56edd336-eca7-4dec-9574-32eaa4bdcca3" />

# Automatizar la instalación de la aplicación web LAMP
Como podemos ver el script esta creado como un archivo llamada install_LAMP.sh

<img width="738" height="1028" alt="image" src="https://github.com/user-attachments/assets/12ada3c5-8d97-4bbc-b8bc-1d7f7c7cafa7" />

Cambiamos los permisos para que se pueda ejecutar.

<img width="449" height="39" alt="image" src="https://github.com/user-attachments/assets/e8389f38-b4eb-4a64-845f-7e6490af4338" />

Y por ultimo usaremos sudo ./install_lamp.sh para ejecutarlo.
Como se ve aquí se a instalado todo correctamente.


<img width="716" height="251" alt="image" src="https://github.com/user-attachments/assets/721ba652-3d21-4ac0-8e46-5f4d83754695" />

<img width="396" height="172" alt="image" src="https://github.com/user-attachments/assets/4635e4e0-75cf-4971-9684-578866ec204b" />

# Instalar la Base de datos de josejuansanchez
El primer paso sera instalar git si no lo tenemos

<img width="579" height="152" alt="image" src="https://github.com/user-attachments/assets/5f60a92f-366d-4f66-9c95-c1d6cd90f32b" />

Ahora clonaremos el repositorio a mi directorio personal

<img width="707" height="195" alt="image" src="https://github.com/user-attachments/assets/a5aced67-108d-443a-af37-8e652ccb824a" />

Creamos el directorio de la aplicación en el web root

<img width="552" height="38" alt="image" src="https://github.com/user-attachments/assets/5c53b2a3-8085-43b8-b3c5-6da70f324e95" />

Copiar los archivos de la aplicación (incluido el archivo SQL)

<img width="713" height="38" alt="image" src="https://github.com/user-attachments/assets/8a2ad35c-4911-4254-84f2-3c4f1af32682" />

# Configurar y Cargar la Base de Datos
## Crear la Base de Datos y el Usuario

Tenemos que acceder a mysql con el comando sudo mysql.

<img width="681" height="217" alt="image" src="https://github.com/user-attachments/assets/348ad0fe-f1b9-4f94-8fba-56341396e763" />

1. Crear la Base de Datos

<img width="680" height="345" alt="image" src="https://github.com/user-attachments/assets/e7237118-6bdb-4947-b3f8-9a718a60d418" />

2. Crear un nuevo Usuario

<img width="680" height="345" alt="image" src="https://github.com/user-attachments/assets/6fe9ba3a-fe90-4346-86cf-6d8b248ec8e6" />

3. Asignar todos los permisos de la base de datos al nuevo usuario

<img width="680" height="345" alt="image" src="https://github.com/user-attachments/assets/9221604b-c93e-46c7-8128-c45d64736a19" />

4. Aplicar los cambios y salir de la consola

<img width="680" height="345" alt="image" src="https://github.com/user-attachments/assets/791df21d-1b91-4d2b-9d44-231e06e2dc6c" />

## Importar la Información
Copiamos el archivo SQL al directorio /var/www/practica-iaw y luego importamos la base de datos

<img width="681" height="102" alt="image" src="https://github.com/user-attachments/assets/c011557f-c0ef-40f6-89ad-0b0c69a42c4c" />

4.3- Configurar PHP

Haremos un ‘sudo nano /var/www/practica-iaw/config.php’ y pondremos lo siguiente que son los datos que se requieren para entrar a la base de datos.

<img width="573" height="164" alt="image" src="https://github.com/user-attachments/assets/c1944c51-d4da-4ede-8c4a-036d4e6421c5" />

Y por ultimo reiniciamos el apache para que se configure todo.

<img width="686" height="41" alt="image" src="https://github.com/user-attachments/assets/ac3044ff-f373-4473-b58f-87b2434a81e7" />

# Instalación de phpMyAdmin

Ver la base de datos completa directamente en el navegador no es posible sin una herramienta de administración instalada, ya que la base de datos (MariaDB/MySQL) está diseñada para funcionar en el servidor.
Para gestionar y ver las tablas e información de la base de datos desde el navegador, tenemos que  instalar phpMyAdmin.

<img width="574" height="137" alt="image" src="https://github.com/user-attachments/assets/32e58011-ecfd-410b-a22d-2256632fb72e" />

Configurar la Conexión de PHP a MySQL

<img width="505" height="61" alt="image" src="https://github.com/user-attachments/assets/1b71581d-3386-4e47-aa63-3cae44a005de" />

Crear un Enlace Simbólico

<img width="793" height="58" alt="image" src="https://github.com/user-attachments/assets/f931f631-cd78-443c-b199-a2b215e06e63" />

# Acceder a la Base de Datos desde el navegador

Como se puede ver esta bien echo ya que nos entra aquí.

<img width="949" height="506" alt="image" src="https://github.com/user-attachments/assets/6eb82cb8-57ef-4ccd-b424-4c913d53f45b" />

