#!/bin/bash

# Creo grupos de usuarios para alumno y profesores:

groupadd p1c2_2024_gAlumno
groupadd p1c2_2024_gProfesores

# Creo usuarios y asignarles contraseñas y grupos:

useradd -m -s /bin/bash -c "primer usuario" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A1
useradd -m -s /bin/bash -c "segundo usuario" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A2
useradd -m -s /bin/bash -c "tercer usuario" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A3
useradd -m -s /bin/bash -c "cuarto usuario" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gProfesores p1c2_2024_P1

# Asigno propiedad y permisos a los directorios de cada alumno:

sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod -R 700 /Examenes-UTN/alumno_3

# Asigno propiedad y permisos al directorio de los profesores:

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod -R 775 /Examenes-UTN/profesores

# Creo archivos de validación validar.txt en cada directorio:

sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1

