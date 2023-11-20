


#FROM  maven:3.8.3-openjdk-11-slim AS build
#WORKDIR /app
#COPY . .
#RUN mvn clean package -DskipTests

FROM openjdk:12.0.2
COPY --from=build /app/target/ads-0.0.1-SNAPSHOT.jar /ads-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/ads-0.0.1-SNAPSHOT.jar"]