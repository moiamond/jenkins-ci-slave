FROM java:8u111-jdk

MAINTAINER moiamond <moiamond@gmail.com>

ENV JENKINS_SWARM_VERSION 3.6
ENV HOME /home/jenkins-slave

# install netstat to allow connection health check with
# netstat -tan | grep ESTABLISHED
# install libapparmor-dev & sudo for exec docker
RUN apt-get update && apt-get install -y net-tools libapparmor-dev sudo && rm -rf /var/lib/apt/lists/*

RUN useradd -c "Jenkins Slave user" -d $HOME -m jenkins-slave

# tricky part
# The docker host has the same user jenkins-slave wihch uid & gid is 1001
# Change the uid & gid to access jenkins-slave @ docker host's home directory.
RUN usermod -u 1001 jenkins-slave
RUN groupmod -g 1001 jenkins-slave
RUN echo "jenkins-slave ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client-$JENKINS_SWARM_VERSION.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION.jar \
  && chmod 755 /usr/share/jenkins

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

RUN chmod +x /usr/local/bin/jenkins-slave.sh

USER jenkins-slave
VOLUME /home/jenkins-slave

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
