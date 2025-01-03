# Usar una imagen base ligera de Golang
FROM golang:1.20-alpine AS builder

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . .

# Descargar dependencias y compilar la aplicación
RUN go mod tidy && go build -o app

# Crear una etapa para ejecutar la aplicación
FROM alpine:latest
WORKDIR /root/

# Copiar el binario compilado desde la etapa de construcción
COPY --from=builder /app/app .

# Copiar las plantillas y archivos estáticos
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["./app"]
