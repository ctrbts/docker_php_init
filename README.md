# Entorno de desarrollo PHP 8.2 con PHP-FPM, Nginx, MariaDB 10.3 y persistencia de datos

_Necesita tener instalado Docker y Docker Compose en su servidor para ejecutar este entorno_

Se utilizan los siguientes servicios en contenedores:

- `app` servicio corriendo PHP 8.2 FPM
- `db` servicio ejecutando MariaDB 10.3
- `adminer` servicio que gestiona la base de datos en `db`
- `nginx` servicio que utiliza el servicio `app` para analizar código PHP antes de servir la aplicación final al usuario

## Corriendo el entorno en 3 pasos

1. Configure las variables de entorno de MariaDB en un archivo `.env`.

2. Cree la imagen de la aplicación con el siguiente comando:

        docker compose build app

3. Cuando finaliza la compilación, puede ejecutar el entorno en segundo plano con:

        docker compose up -d

Ahora vaya a su navegador y acceda al dominio o dirección IP de su servidor en el puerto 8000 con `http://server_domain_or_IP:8000`. En caso de que esté ejecutando en su máquina local, use `http://localhost:8000` para acceder a la aplicación desde su navegador. Adminer se sirve desde `http://localhost:8081`

## Comandos comunes

- Para mostrar información sobre el estado de tus servicios activos, ejecute:

        docker compose ps

- Puede usar el comando `docker compose exec` para ejecutar comandos en los contenedores de servicios, como `ls -l` para mostrar información detallada sobre los archivos en el directorio de la aplicación:

        docker compose exec app ls -l

- Puede usar el comando de registros para verificar los registros generados por sus servicios:

        docker compose logs nginx

- Si desea pausar su entorno Docker Compose mientras mantiene el estado de todos sus servicios, ejecute:

        docker compose pause

- A continuación, puede reanudar sus servicios con:

        docker compose unpause

- Para cerrar su entorno de Docker Compose y eliminar todos sus contenedores, redes y volúmenes, ejecute:

        docker compose down
