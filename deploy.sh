#!/bin/bash

# Configuración
BUCKET_NAME="mi-bucket-devops531siu"
REGION="us-east-1"

# Mensaje informativo
echo "Iniciando despliegue al bucket S3: $BUCKET_NAME"

# Sincronizar archivos con S3
aws s3 sync ./ s3://$BUCKET_NAME/ --exclude "*.sh" --exclude ".git/*" --region $REGION

# Verificar si hubo errores
if [ $? -eq 0 ]; then
    echo "Despliegue completado exitosamente."
    echo "El sitio está disponible en: http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
else
    echo "Error durante el despliegue."
fi
