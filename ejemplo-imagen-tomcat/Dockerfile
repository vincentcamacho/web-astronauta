FROM tomcat:jdk8-openjdk

LABEL maintainer="NeoDevops@gmail.com"

WORKDIR /usr/local/tomcat/webapps/

COPY ./codigo/ .

EXPOSE 8080

CMD ["catalina.sh", "run"]