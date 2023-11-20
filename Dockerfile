# Estágio de Construção
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app

# Copie apenas o arquivo pom.xml para o contêiner
COPY pom.xml .

# Baixe as dependências Maven (isso será cacheado, a menos que o pom.xml mude)
RUN mvn dependency:go-offline

# Copie os arquivos de origem para o contêiner
COPY src ./src

# Empacote a aplicação usando o Maven
RUN mvn package -DskipTests

# Estágio de Execução
FROM openjdk:11-jre-slim

WORKDIR /app

# Copie o JAR construído do estágio anterior para o contêiner
COPY --from=build /app/target/ads-0.0.1-SNAPSHOT.jar /app/app.jar

# Exponha a porta que a aplicação Spring Boot utiliza (geralmente 8080)
EXPOSE 8081

# Comando para iniciar a aplicação quando o contêiner for iniciado
CMD ["java", "-jar", "app.jar"]