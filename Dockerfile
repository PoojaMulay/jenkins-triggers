FROM openjdk:8
EXPOSE 8080
ADD target/Jenkins-Trigger.jar Jenkins-Trigger.jar
ENTRYPOINT ["java","-jar","/Jenkins-Trigger.jar"]
