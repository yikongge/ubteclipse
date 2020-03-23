#
# Ubuntu exlipse (ubte) Dockerfile
#
# https://github.com/yikongge/ubteclipse
#

# Pull base image.
FROM ubuntu

############COPY sources.list /etc/apt/
COPY apache-tomcat-9.0.33.tar.gz /tmp
COPY tomcat.service /etc/systemd/system
COPY eclipse-inst-linux64.tar.gz /opt
RUN tar xzvf /opt/eclipse-inst-linux64.tar.gz -C /opt
RUN mkdir /root/eclipse-workspace

RUN \
  apt-get update
#install Tomcat
RUN apt install -y default-jdk
RUN apt install -y default-jre
RUN useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
RUN tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
RUN ln -s /opt/tomcat/apache-tomcat-9.0.33 /opt/tomcat/latest
RUN chown -RH tomcat: /opt/tomcat/latest
RUN sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
#RUN sysctl daemon-reload
#install base
RUN apt install -y libxext-dev
#COPY resolv.conf /etc
RUN apt-get install -y qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer qtcreator

# Define default command.
#CMD ["bash"]

# Expose ports.
EXPOSE 8080
