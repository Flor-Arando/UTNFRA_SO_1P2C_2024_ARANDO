#!/bin/bash

# Para ejecutar el script hay que posicionarse en la carpeta RTA_ARCHIVOS_Examen_20241012 y se podrá ejecutar lo siguiente:


# Muestra el total de memoria RAM (MemTotal) y escribe en Filtro_Basico.txt:

grep MemTotal /proc/meminfo > RTA_ARCHIVOS_Examen_20241012/Filtro_Basico.txt

# Muestra el chasis y añade la información hacia el archivo Filtro_Basico.txt:

dmidecode -t chassis | grep "Manufacturer" >> RTA_ARCHIVOS_Examen_20241012/Filtro_Basico.txt

