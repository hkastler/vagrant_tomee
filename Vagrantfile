# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true
  
	config.vm.define :tomee do |tomee|
	# Every Vagrant virtual environment requires a box to build off of.
	tomee.vm.box = "opscode_ubuntu-13.10_chef-provisionerless"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
	tomee.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-13.10_chef-provisionerless.box"
	# Provider-specific configuration so you can fine-tune various
	  # backing providers for Vagrant. These expose provider-specific options.
	  # Example for VirtualBox:
	  #
	   tomee.vm.provider :virtualbox do |vb|
		 vb.name = "Tomee"
	  
	 #   # Use VBoxManage to customize the VM. For example to change memory:
		 vb.customize ["modifyvm", :id, "--memory", "1024"]
	   end
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
   tomee.vm.network :forwarded_port, guest: 8080, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
	tomee.vm.network :private_network, ip: "172.16.30.12"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  
  #
  # View the documentation for the provider you're using for more
  # information on available options.
	#tomee.vm.provision :shell, :path => "bootstrap.sh"
  #
   tomee.vm.provision :chef_solo do |chef|
  
     chef.add_recipe "apt"
	 chef.add_recipe "ark"
     chef.add_recipe "java"
     chef.add_recipe "tomee"
	 
	 chef.json = {
        :java => {
          :install_flavor => "oracle",
          :jdk_version => "7",
          :oracle => {
            :accept_oracle_download_terms => true
          }		  
        },
		
        :tomee=>{
			:version => "1.6.0-plus",
			:url_version => "http://mirror.cc.columbia.edu/pub/software/apache/tomee/tomee-1.6.0/apache-tomee-1.6.0-plus.zip",
			:user => "tomee",
			:group => "tomee",			
			:jndi_id => "jdbc/roller",
			:jdbc_url => "jdbc:mysql://172.16.10.10:3306/rollerdb",
			:jndi_username => "roller",
			:jndi_password => "keeprollin",
			:jdbcjar => "mysql-connector-java-5.1.29-bin.jar"
			
		}
	} 
	end

  end
end