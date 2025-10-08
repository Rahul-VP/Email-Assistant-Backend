# Build stage
FROM maven:3.9.9-eclipse-temurin-23 AS build
WORKDIR /email-writer-sb
COPY . .
RUN mvn clean package -DskipTests

# Package stage
FROM eclipse-temurin:23-jre
WORKDIR /app
COPY --from=build /email-writer-sb/target/email-writer-sb-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]