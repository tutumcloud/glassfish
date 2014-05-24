FROM tifayuki/java:java7
MAINTAINER Feng Honglin <hfeng@tutum.co>

# install glassfish 4.0
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip
RUN wget download.java.net/glassfish/4.0/release/glassfish-4.0.zip
RUN unzip glassfish-4.0.zip -d /opt
RUN rm glassfish-4.0.zip
ENV PATH /opt/glassfish4/bin:$PATH

RUN apt-get install -y pwgen expect
ADD run.sh /run.sh
ADD change_admin_password.sh /change_admin_password.sh
ADD change_admin_password_func.sh /change_admin_password_func.sh
ADD enable_secure_admin.sh /enable_secure_admin.sh
RUN chmod +x /*.sh

EXPOSE 8080
EXPOSE 4848

CMD ["/run.sh"]
