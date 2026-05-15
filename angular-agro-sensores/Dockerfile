# Arquitetura Multi-stage
# FASE 1: Build (A "Fábrica" Node.js)
FROM node:22-alpine AS build
WORKDIR /app

# 1. Instalar dependências (copiamos apenas os arquivos de pacotes primeiro)
COPY package*.json ./

# 2. Aqui, estamos executando as instalações das dependencias via npm ci
# Instala exatamente aqui que esta indicado 
# --quiet: reduz "informações" de logs - ou seja - é menos "verboso"
# --no-audit: desabilita auditoria de segurança durante a instalação  
RUN npm ci --quiet --no-audit

# 3. copiar os arquivos - da origem para o destino
COPY . . 

# agora, vamos "rodar" a build - para produção
# RUN npm run build -- --configuration production 
RUN node --max-old-space-size=4096 ./node_modules/@angular/cli/bin/ng build --configuration production


# FASE 2: RUNTIME - EXECUÇÃO
# no angular 19 +, o build final fica semelhante a este path:
# dist/[nome-projeto]/browser 
FROM nginx:alpine

# 1. # **** esta é pasta de destino
#                        origem               destino - a pasta padrão nginx onde tudo fica acessivel para o browser
COPY --from=build /app/dist/*/browser /usr/share/nginx/html

# 2.  aqui, vamos indicar uma instrução para tentar evitar o erro 404 - erro de rotas
# este passo é opcional MAS é fortemente RECOMENDADO
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# 3. "expor" a porta
EXPOSE 80

# comando de execução do servidor - ngnx -g "daemon off;" foreground - em primeiro plano
#                                           "daemon node;"  aqui, em background - segundo plano - o container morreria 
CMD ["nginx", "-g", "daemon off;"]


