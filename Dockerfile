FROM openjdk:11
ADD target/tpachatproject-1.0.jar tpachatproject.jar
ENTRYPOINT ["java","-jar","/tpachatproject.jar"]
