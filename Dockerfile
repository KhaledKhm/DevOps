FROM openjdk:11
EXPOSE 8089
COPY target/tpachatproject-1.0.jar tpachatproject.jar
ENTRYPOINT ["java","-jar","/tpachatproject.jar"]
