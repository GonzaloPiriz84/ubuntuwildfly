FROM ubuntu:focal
RUN apt-get update
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install unzip -y
RUN apt install openjdk-8-jdk -y

RUN apt-get -y install openssh-client

#RUN mkdir /keys
#RUN mkdir /root/.ssh/ 
#RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
#ENV JAVA_OPTS -Xms5120m -Xmx10240m
ENV JBOSS_HOME /opt/wildfly-10.1.0.Final
ENV JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true"


ENV PATH "$PATH":/${JAVA_HOME}/bin:.:
ENV VERSION 10.1.0.Final
ENV INSTALL_DIR /opt
ENV WILDFLY_HOME ${INSTALL_DIR}/wildfly-${VERSION}
#ENV DEPLOYMENT_DIR ${WILDFLY_HOME}/standalone/deployments/

RUN wget http://download.jboss.org/wildfly/${VERSION}/wildfly-${VERSION}.zip \
    && unzip wildfly-${VERSION}.zip -d ${INSTALL_DIR} \
    && rm wildfly-${VERSION}.zip \
    && rm ${WILDFLY_HOME}/bin/standalone.conf \
    && chmod a+x ${WILDFLY_HOME}/bin/standalone.sh
#ADD standalone.conf ${WILDFLY_HOME}/bin/

