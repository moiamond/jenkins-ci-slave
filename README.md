# jenkins-ci-slave

Inspire by [`csanchez/jenkins-swarm-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-swarm-slave/) and [`DooD`](http://container-solutions.com/running-docker-in-jenkins-in-docker/) (Docker-outside-of-Docker).

## Building
    docker build -t jenkins-swarm-slave .
    
## Running
    docker run -d 
            --name jenkins-swarm-slave \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v /usr/bin/docker:/usr/bin/docker \
            jenkins-swarm-slave \
            -master http://jenkins:8080 \
            -name slave
