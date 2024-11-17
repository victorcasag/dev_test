FROM node:18-alpine

WORKDIR /app

# Copie o package.json e package-lock.json para garantir que as dependências sejam instaladas
COPY package.json package-lock.json ./

# Instale as dependências, incluindo as dependências de desenvolvimento como o TypeScript
RUN npm install

# Instale o TypeScript globalmente para garantir que o comando `tsc` esteja disponível
RUN npm install -g typescript

# Copie o restante dos arquivos do projeto para o contêiner
COPY . .

# Execute o comando para compilar o TypeScript
RUN npx tsc

# Exponha a porta 3000
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["node", "dist/index.js"]
