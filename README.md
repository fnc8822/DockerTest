# 📈 GNU Octave CLI

## 📋 Descripción
Script matemático que ejecuta cálculos numéricos usando GNU Octave. Perfecto para procesamiento científico en Docker.

## 💡 Warning
Las siguientes `warnings` son para crear el `dockerfile`
 * Se recomienda empezar desde la siguiente imagen: `gnuoctave/octave:lastest`
 * No olvidar copiar el file `script.m` dentro del docker
 * Es fundamental que se ejecute el comando `CMD` al runnear la `docker image`

https://github.com/NicoxMelia/DockerExamples/tree/main/octave-math
```bash
# Ejecutar el proyecto
octave script.m
```



## 🔧 Configuración Docker

### Prerrequisitos
- Docker instalado en tu sistema
- Archivo `script.m` en el directorio del proyecto
- Dockerfile configurado correctamente

### Estructura del proyecto
```
proyecto-octave/
├── Dockerfile
├── script.m
└── docker_setup.md
```

### 📄 Dockerfile
```dockerfile
# Usar la imagen base recomendada de GNU Octave
FROM gnuoctave/octave:7.3.0

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo script.m al contenedor
COPY script.m .

# Comando que se ejecutará cuando se haga docker run
CMD ["octave", "script.m"]
```

## 🛠️ Construcción de la imagen

### Paso 1: Construir la imagen Docker
```bash
# Navegar al directorio del proyecto
cd proyecto-octave/

# Construir la imagen con un tag específico
docker build -t octave-app:latest .

# Verificar que la imagen se creó correctamente
docker images | grep octave-app
```

### Paso 2: Verificar la construcción
```bash
# Listar imágenes Docker disponibles
docker images

# Inspeccionar detalles de la imagen
docker inspect octave-app:latest
```

## 🏃‍♂️ Ejecución del contenedor

### Ejecutar el script una vez
```bash
# Ejecutar el contenedor (se ejecutará el script y se cerrará)
docker run octave-app:latest

# Ejecutar con logs detallados
docker run --rm octave-app:latest
```

### Ejecutar en modo interactivo
```bash
# Modo interactivo para debugging
docker run -it octave-app:latest /bin/bash

# Una vez dentro del contenedor, ejecutar manualmente:
# octave script.m
```

### Ejecutar con volúmenes (opcional)
```bash
# Montar directorio local para acceso a archivos
docker run -v $(pwd):/app octave-app:latest
```

## 📊 Comandos útiles

### Gestión de contenedores
```bash
# Ver contenedores en ejecución
docker ps

# Ver todos los contenedores (incluyendo detenidos)
docker ps -a

# Limpiar contenedores detenidos
docker container prune
```

### Gestión de imágenes
```bash
# Eliminar imagen específica
docker rmi octave-app:latest

# Limpiar imágenes no utilizadas
docker image prune

# Reconstruir imagen desde cero (sin cache)
docker build --no-cache -t octave-app:latest .
```

## 🐛 Debugging y troubleshooting

### Verificar logs del contenedor
```bash
# Ver logs del último contenedor ejecutado
docker logs $(docker ps -lq)

# Seguir logs en tiempo real
docker logs -f <container_id>
```

### Acceso directo al contenedor
```bash
# Ejecutar bash en el contenedor para debugging
docker run -it --entrypoint=/bin/bash octave-app:latest

# Verificar que el script existe dentro del contenedor
docker run --rm octave-app:latest ls -la /app/
```

## ✅ Validación del setup

Para verificar que todo funciona correctamente:

1. **Construcción exitosa**: La imagen se crea sin errores
2. **Script copiado**: El archivo `script.m` está presente en `/app/`
3. **Ejecución automática**: El comando `octave script.m` se ejecuta al hacer `docker run`
4. **Salida esperada**: El script produce la salida matemática esperada

```bash
# Test completo del setup
docker build -t octave-app:latest . && docker run --rm octave-app:latest
```