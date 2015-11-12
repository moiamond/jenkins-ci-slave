#!/bin/bash

docker run -d \
	--name jenkins-swarm-slave \
	-v /home/jenkins-slave/workspace:/home/jenkins-slave/workspace \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /usr/bin/docker:/usr/bin/docker \
	jenkins-swarm-slave \
	-master http://192.168.200.196:8000 \
	-labels docker \
	-name slave1
