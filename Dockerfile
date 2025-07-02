FROM eclipse-temurin:17-alpine

WORKDIR /app

COPY resources /app/resources
COPY target/jira.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
