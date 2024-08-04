Breach Box

Breach Box es un script de Bash para realizar tareas de escaneo de seguridad de redes. Ofrece opciones para realizar escaneos de puertos con nmap, búsquedas de directorios y subdominios con gobuster, y pruebas de inyecciones SQL con sqlmap.
Funcionalidades

    Escaneo de puertos: Realiza escaneos rápidos, completos, de servicios y detección de sistemas operativos usando nmap.
    Escaneo de directorios y subdominios: Utiliza gobuster para buscar directorios y subdominios en un objetivo.
    Inyección SQL: Ejecuta pruebas de inyección SQL usando sqlmap, con varias opciones de escaneo.

Requisitos

Antes de ejecutar el script, asegúrate de tener instalados los siguientes programas:

    nmap
    gobuster
    sqlmap

Puedes instalarlos en sistemas basados en Debian usando:

bash

sudo apt-get install nmap gobuster sqlmap

Uso

    Clona este repositorio:

    bash

git clone https://github.com/AnFerCod3/breach-box.git
cd breach-box

Dale permisos de ejecución al script:

bash

chmod +x breach-box.sh

Ejecuta el script:

bash

    ./breach-box.sh

    Sigue las instrucciones en pantalla para seleccionar las opciones de escaneo y proporcionar los parámetros necesarios.

Opciones del Menú

    1. Port Scanning: Escanea puertos del objetivo usando nmap.
        Opciones: Escaneo rápido, escaneo completo, detección de servicios, detección de sistema operativo, escaneo de vulnerabilidades, opciones personalizadas.
    2. Directory Scanning: Busca directorios y subdominios usando gobuster.
        Opciones: Escaneo de directorios, escaneo de subdominios, opciones personalizadas.
    3. SQL Injection: Realiza pruebas de inyección SQL con sqlmap.
        Opciones: Escaneo básico, detección y explotación automatizadas, escaneo de bases de datos específicas, opciones personalizadas.
    4. Exit: Salir del script.

Ejemplos

Escaneo de puertos rápido con nmap:

    Selecciona la opción 1 en el menú principal.
    Luego, elige la opción 1 para un escaneo rápido.

Búsqueda de directorios con gobuster:

    Selecciona la opción 2 en el menú principal.
    Luego, elige la opción 1 para buscar directorios.

Pruebas de inyección SQL con sqlmap:

    Selecciona la opción 3 en el menú principal.
    Luego, elige la opción 1 para un escaneo básico.
