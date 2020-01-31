FROM ubuntu:18.04
MAINTAINER "Bui The Phong" <buithephong@gmail.com>
RUN \
  apt -y update && \
  export DEBIAN_FRONTEND="noninteractive" && \
  debconf-set-selections <<< "mysql-server mysql-server/root_password password Abc@123" && \
  debconf-set-selections <<< "mysql-server mysql-server/root_password_again password Abc@123" && \
  apt install -y mysql-server-5.7 && \
  mysql_secure_installation
EXPOSE 3306
CMD ["mysqld"]
