FROM openjdk:11
ADD target/tpachatproject-1.0.jar tpachatproject-1.0.jar
ENTRYPOINT ["java","-jar","/tpachatproject-1.0.jar"]
