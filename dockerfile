# Usar la imagen base recomendada de GNU Octave
FROM gnuoctave/octave:latest

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo script.m al contenedor
COPY script.m .

# Comando que se ejecutará cuando se haga docker run
CMD ["octave", "script.m"]
