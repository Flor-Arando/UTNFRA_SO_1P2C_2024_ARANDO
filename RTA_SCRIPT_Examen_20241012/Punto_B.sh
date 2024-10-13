#!/bin/bash

# Mostrar los discos y particiones actuales
sudo fdisk -l

# Iniciar el particionado del disco /dev/sdc
sudo fdisk /dev/sdc <<EOF
n   # Nueva partición
p   # Partición primaria 1
    # Dejar en blanco para usar el siguiente número disponible
    # Inicio por defecto
+1G # Tamaño de 1GB

n   
p   


+1G 

n
p   # Partición primaria 3
    
    
+1G 

n   
e   # Crear partición extendida
    
     

n   # Nueva partición lógica
    
+1G 

n   
    
+1G 

n   
    
+1G 

n   
    
+1G 

n   
    
+1G 

n   
    
+1G 

n   
    
+1G 

w   # Escribir cambios y salir
EOF

# Formatear particiones primarias y lógicas
sudo mkfs -t ext4 /dev/sdc1  # Primaria 1
sudo mkfs -t ext4 /dev/sdc2  # Primaria 2
sudo mkfs -t ext4 /dev/sdc3  # Primaria 3
sudo mkfs -t ext4 /dev/sdc5  # Lógica 1 (dentro de la partición extendida)
sudo mkfs -t ext4 /dev/sdc6  # Lógica 2
sudo mkfs -t ext4 /dev/sdc7  # Lógica 3
sudo mkfs -t ext4 /dev/sdc8  # Lógica 4
sudo mkfs -t ext4 /dev/sdc9  # Lógica 5
sudo mkfs -t ext4 /dev/sdc10 # Lógica 6
sudo mkfs -t ext4 /dev/sdc11 # Lógica 7

# Verificar los discos formateados
sudo lsblk

# Actualizar el archivo /etc/fstab para montar particiones (solo las primarias y lógicas)
echo '/dev/sdc1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0' | sudo tee -a /etc/fstab
# No se monta /dev/sdc4 porque es la partición extendida.
echo '/dev/sdc5 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc6 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc7 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc8 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc9 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc10 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc11 /Examenes-UTN/profesores ext4 defaults 0 0' | sudo tee -a /etc/fstab

