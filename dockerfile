# Stage 1: Build the JAR File
FROM maven:3.9.6-openjdk-11-slim AS build
WORKDIR /home/app
COPY . .
RUN mvn -B -DskipTests clean package

# Stage 2: Create the Image
FROM openjdk:11-jre-alpine
WORKDIR /app
COPY --from=build /home/app/target/hello-world-java.jar ./hello-world-java.jar
EXPOSE 5000
CMD ["java", "-jar", "hello-world-java.jar"]

