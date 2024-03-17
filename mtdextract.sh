#!/bin/bash

# Comprueba si exiftool está instalado
if ! command -v exiftool &> /dev/null; then
    echo "Error: exiftool no está instalado. Por favor, instálalo primero."
    exit 1
fi

# Verifica si se proporcionó un directorio como argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

# Guarda el directorio proporcionado como argumento
directorio="$1"

# Verifica si el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: el directorio '$directorio' no existe."
    exit 1
fi

# Recorre todas las imágenes en el directorio y muestra sus metadatos
echo "Extrayendo metadatos de imágenes en el directorio: $directorio"
for imagen in "$directorio"/*.{jpg,jpeg,png}; do
    echo "Metadatos de: $imagen"
    exiftool "$imagen"
    echo "----------------------------------------------"
done

echo "Extracción de metadatos completa."
