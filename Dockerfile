FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/myproj-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} myproj.jar
EXPOSE 8888
ENTRYPOINT ["java","-jar","myproj.jar"]
