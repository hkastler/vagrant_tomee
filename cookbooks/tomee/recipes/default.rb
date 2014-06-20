#
# Cookbook Name:: tomee
# Recipe:: default
#
# Copyright 2014, Reltask Inc<reltask@gmail.com>
#
# Cheers!
#

include_recipe "ark"

user node[:tomee][:user] do
  comment "Tomee User"
  home "/home/#{node[:tomee][:user]}"
  shell "/bin/bash"
  supports :manage_home=>true
end

group node[:tomee][:group] do
  action :create
  members "#{node[:tomee][:user]}"
end

ark "tomee" do
  url node[:tomee][:url_version]
  version node[:tomee][:version]
  prefix_root node[:tomee][:install_path]
  home_dir node[:tomee][:home]
  owner node[:tomee][:user]
  group node[:tomee][:group]
  action :install
end

template "#{node[:tomee][:home]}/bin/init.d.tomee" do
  source "init.d.tomee.erb"
  mode 0744
  owner node[:tomee][:user]
end

link "/etc/init.d/tomee" do
  to "/opt/tomee/bin/init.d.tomee"
end

template "#{node[:tomee][:home]}/conf/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  mode 0744
  owner node[:tomee][:user]
  variables({
     :roles => ["tomee-admin","manager-gui","admin-gui","manager","admin","manager-script"],
	 :username => "tomee",
	 :password => "canyouhearmee"	 
  })
end

template "#{node[:tomee][:home]}/conf/tomee.xml" do
  source "tomee.xml.erb"
  mode 0744
  owner node[:tomee][:user]
  variables({
     :jndi_id => node[:tomee][:jndi_id],
	 :jdbc_driver => node[:tomee][:jdbc_driver],
	 :jdbc_url => node[:tomee][:jdbc_url],
	 :username => node[:tomee][:jndi_username],
	 :password => node[:tomee][:jndi_password],	 
  })
end


cookbook_file "#{node[:tomee][:jdbcjar]}" do
  path "#{node[:tomee][:home]}/lib/#{node[:tomee][:jdbcjar]}"
  owner node[:tomee][:user]
  group node[:tomee][:group]
  action :create_if_missing
end


service "tomee" do
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

##include_recipe "tomee::users"