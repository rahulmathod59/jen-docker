FROM maven:3.8.6-eclipse-temurin-8 AS BUILD
WORKDIR /rahul
COPY . /rahul
COPY ./libraries /root/.m2
RUN mvn clean package

FROM tomcat:8.0-alpine
COPY --from=0 /rahul/target/calculator.war $CATALINA_HOME/webapps/calculator.war
CMD ["catalina.sh","run"]
