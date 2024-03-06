# Use an OpenJDK image as the base image for building
FROM maven:3.8.3-openjdk-11-slim AS build
WORKDIR /app
COPY mvnw .mvn ./
COPY pom.xml ./
COPY src src/
RUN ./mvnw clean package -DskipTests
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

