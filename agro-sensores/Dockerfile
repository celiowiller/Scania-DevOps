# FASE 1 - BUILD
# passo 1: vamos estabelecer o mesmo contexto de operação que definimos no
# 1º Dockerfile que criamos para o projeto de container do modelo ML 
# abaixo, observamos o uso de um recurso na versão 21
# basicamente, o Docker vai "baixar" uma imagem que já será composta da seguinte forma:
	# Maven instalado
	# Java 21  - java version instalado
	# o ambiente linus ncessario, já configurado
# maven:3.9-eclipse-temurin-21 AS build: este é o nome da imagem 
# AS build: ao usar este comando, aqui, portanto, esta sendo criado um nome para esta etapa
# então esta etapa recebe o nome BUILD
FROM maven:3.9-eclipse-temurin-21 AS build

# passo 2: aqui, estamos indicando o local/onde os arquivos estarão - dentro do "computador/maquina" 
# que estamos criando -a partir do Docker - neste caso, numa pasta que estamos nomeando como /app
WORKDIR /app

# passo 3: aqui, estamos copiando o projeto para dentro do container   
# do "computador/maquina" real - nosso pc - para dentro do Docker 
# abaixo, temos o comando COPY . . : . -> origem , . -> destino 
COPY . .

# 4. agora, estamos indicando quais são as depedencias necessarias 
# para que minha aplicação funcione - a partir do Docker.
# é possivel fazer estas referencias de instalação em partes; aqui, abaixo, 
# por exemplo, estamos fazendo as instalações basicas necessarias para a genração e
# "empacotamento" da aplicaçã backend
RUN mvn clean package -DskipTest

# ***** este Dockerfile ele deve trabalhar no padrão conhecido como multi-stage build
# em função da contexto da aplicação - Java/Springboot

# FASE 2: RUNTIME
# procedimento de execução da aplicação - via Docker
FROM eclipse-temurin:21-jre-jammy 
# Java Runtime, sem o maven, sem as ferramentas de compilação 
# jammy: Ubuntu 22.* LTS, nome oficial: Jammy JellyFish

WORKDIR /app

# esta é a linha mais importante da aplicação; pois ela acessar qualquer aquivo com a extensão
# .jar - a partir do build ja feito - e copia para a imagem final; /app/app.jar
COPY --from=build /app/target/*.jar app.jar

# aqui, esta "exposta" a porta pela qual a aplicação backend será acessada
EXPOSE 8080

# aqui, abaixo, está o comando que inicia o container
# em CLI, executamos da seguinte forma: java -jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
























