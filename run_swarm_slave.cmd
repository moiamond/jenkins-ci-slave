@echo off

java -jar swarm-client-2.0-jar-with-dependencies.jar ^
    -master http://jenkins-master:8080/ ^
    -name slave
