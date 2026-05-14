# ESTÁGIO 1: Build (A "Fábrica" Node.js)
FROM node:22-alpine AS build
WORKDIR /app

# 1. Instalar dependências (copiamos apenas os arquivos de pacotes primeiro)
COPY package*.json ./
RUN npm ci --quiet --no-audit

# 2. Copiar o código fonte e gerar os arquivos de produção
COPY . .
RUN npm run build -- --configuration production

# ESTÁGIO 2: Servidor (A "Entrega" com Nginx)
FROM nginx:alpine

# No Angular 19, o build final fica em dist/[nome-do-projeto]/browser
# IMPORTANTE: Substitua 'agro-front' pelo nome real do seu projeto no package.json
#usar um asterisco *. Assim, o Docker vai pegar qualquer pasta que o Angular tenha criado dentro de dist, sem depender do nome exato
COPY --from=build /app/dist/*/browser /usr/share/nginx/html

# Copiamos uma configuração personalizada do Nginx para evitar erros de rotas (404)
# (Opcional, mas recomendado para SPAs)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]