FROM maven:3.8.6-openjdk-11 AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package


FROM tomcat:9.0-jdk11

COPY --from=builder /app/target/FinalProject.war /usr/local/tomcat/webapps/

EXPOSE 9000

CMD ["catalina.sh","run"]


