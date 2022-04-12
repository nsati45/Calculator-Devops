FROM openjdk
COPY ./target/Calculator-DevOps-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "Calculator-Devops-1.0-SNAPSHOT-jar-with-dependencies.jar"]
