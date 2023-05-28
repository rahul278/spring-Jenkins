FROM openjdk:11
EXPOSE 8091
ADD target/spring-Jenkins-0.0.1-SNAPSHOT.jar spring-Jenkins-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/spring-Jenkins-0.0.1-SNAPSHOT.jar"]