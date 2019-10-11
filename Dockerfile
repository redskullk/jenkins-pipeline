FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/myproj-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} myproj.jar
ENTRYPOINT ["java","-jar","/myproj.jar"]
