#!/bin/bash

# Nos movemos al directorio de RTA_ARCHIVOS_Examen_20241012:

cd RTA_ARCHIVOS_Examen_20241012

# Obtengo y escribo la información en Filtro_Avanzado.txt con { ... } para redirigir todas las líneas a la vez:

{
  echo "Mi IP Publica es: $(curl -s ifconfig.me)"
  echo "Mi usuario es: $(whoami)"
  echo "El Hash de mi Usuario es: $(sudo grep $(whoami) /etc/shadow | cut -d: -f2)"
  echo "La URL de mi repositorio es: $(git remote get-url origin)"
} > Filtro_Avanzado.txt

# Muestro el contenido del archivo:

cat Filtro_Avanzado.txt

