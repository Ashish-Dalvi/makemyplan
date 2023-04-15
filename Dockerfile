# Pull tomcat latest image from dockerhub
FROM tomcat:8.0.51-jre8-alpine
MAINTAINER ashish.dalvi0211@gmail.com
# copy war file on to container ec2
COPY ./target/makemyplan-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps
EXPOSE  8080
USER makemyplan
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
