#!/bin/bash
# Script: buscar_candidatos_BRAF.sh 
# Descripcion: Busca en todos los archivos .fasta de una carpeta los pacientes
# con la mutacion V600E de BRAF y guarda su cabecera y secuencia en unico archivo.
# Uso:  ./buscar_candidatos_BRAF.sh [carpeta_con_los_fasta]
# Carpeta con los archivos .fasta (1er argumento; si no se indica, usa la carpeta actual)
DIRECTORIO="${1:-.}"

# Secuencia de la mutacion V600E  que se busca
MOTIVO="CTACAGAGAAATC"

# Archivo de resultados (se crea en la carpeta desde la que se ejecuta el scrpt)
SALIDA="pacientes_candidatos_BRAF.fasta"

# Buscar el motivo en todos los .fasta y guardar cabecera + secuencia:
# -h                       no escribe el nombre del archivo delante de cada linea
# -B 1                      incluye la linea anterior al acierto ( la cabecera)
# --no-group-separator      evita las lineas "--" entre grupos de resultados

grep -h -B 1 --no-group-separator "$MOTIVO" "$DIRECTORIO"/*.fasta > "$SALIDA"

# Mostrar cuantos pacientes se han encontrado 
echo "Pacientes candidatos: $(grep -c '>' "$SALIDA")"




