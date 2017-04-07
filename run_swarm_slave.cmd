@echo off

java -jar swarm-client-3.3.jar ^
    -master http://jenkins-master:8080/ ^
    -name slave
