FROM ubuntu:16.04

RUN  apt update
RUN  apt-get install -y openjdk-8-jdk -y maven -f libpng16-16 -f libjasper1 -f libdc1394-22 git


RUN git clone https://github.com/barais/TPDockerSampleApp
WORKDIR  /TPDockerSampleApp

#install maven
RUN  mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar

RUN mvn package 
ENTRYPOINT ["java", "-Djava.library.path=lib/", "-jar", "target/fatjar-0.0.1-SNAPSHOT.jar"]

EXPOSE 2368