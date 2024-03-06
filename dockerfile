FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY target/your-application.jar .
EXPOSE 8080
CMD ["java", "-jar", "your-application.jar"]
