#
# Cookbook Name:: tomee
# Attributes:: default
#
# Author:: Reltask Inc<reltask@gmail.com>

default[:tomee][:version] = "1.6.0-jaxrs"
default[:tomee][:url_version] = "http://mirror.cc.columbia.edu/pub/software/apache/tomee/tomee-1.6.0/apache-tomee-1.6.0-jaxrs.tar.gz"

default[:tomee][:install_path] = "/opt/"
default[:tomee][:home] = "/opt/tomee"
default[:tomee][:user] = "root"
default[:tomee][:group] = "root"

default[:tomee][:jdbcjar] = "postgresql-9.3-1101.jdbc41.jar"
##default[:tomee][:jdbcjar_source] = "http://jdbc.postgresql.org/download/postgresql-9.3-1101.jdbc41.jar"
default[:tomee][:jndi_id] = "jdbc/tomee"
default[:tomee][:jdbc_driver] = "org.postgresql.Driver"
default[:tomee][:jdbc_url] = "jdbc:postgresql://192.168.33.12:5432/tomee"
default[:tomee][:jndi_username] = "tomee"
default[:tomee][:jndi_password] = "canyouhearmee"





