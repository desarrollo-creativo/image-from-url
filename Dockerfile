# Usar la imagen oficial de Node.js (versión 20.18.0, la más reciente a junio 2025)
FROM node:20.18.0-slim

# Instalar dependencias de Puppeteer
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libnss3 \
    libgtk-3-0 \
    libgbm1 \
    libasound2 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Establecer directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json (si existe) para instalar dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto (ajusta según tu aplicación, 3000 es común)
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]