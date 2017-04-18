# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-14.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.11"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "~/Desktop/Web", "/var/www"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.memory = "1536"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  config.vm.provision :chef_solo do |chef|
    chef.version = '12.8.1'
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "build-essential"
    chef.add_recipe "apt"
    chef.add_recipe "updater::mysql"
    chef.add_recipe "nodejs"
    chef.add_recipe "updater"
    chef.add_recipe "rvm::user"
    chef.add_recipe "vim"

    # Install Ruby 2.2.1 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
      "rvm" => {
        "gpg_key" => "409B6B1796C275462A1703113804BB82D39DC0E3",
        "user_install_rubies" => true,
        "installs" => {
           "vagrant" => {"upgrade" => "stable", "action" => "install"}
        },
        "user_installs" => [
          {
            "user" => "vagrant",
            "default_ruby" => "ruby-2.2.3",
            "rubies" => ["ruby-2.2.3"],
            "gems" => {
              "ruby-2.2.3" => [
                {
                  "name" => "bundler",
                  "version" => "1.10.6"
                },
                {
                  "name" => "rails",
                  "version" => "5.0.0.1"
                },
                {
                  "name" => "sass",
                  "version" => "3.2.19"
                },
                {
                  "name" => "compass",
                  "version" => "0.12.6"
                },
                {
                  "name" => "scss-lint",
                  "version" => "0.24.1"
                },
                {
                  "name" => "sass-css-importer",
                  "version" => "1.0.0.beta.0"
                }
              ]
            }
          }
        ],
        "rvmrc_env" => {
          "rvm_autolibs_flag" => "disabled",
          "rvm_gem_options" => "--no-ri --no-rdoc"
        }
      },
      mysql: {
        server_root_password: ''
      }
    }
  end

  config.ssh.forward_agent = true
end
