FROM eclipse-temurin:17
LABEL maintainer="jonathan2406.garcia@gmail.com"
COPY target/*.jar /home/spring-petclinic.jar
CMD ["java", "-jar", "/home/spring-petclinic.jar"]