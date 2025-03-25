Vagrant.configure("2") do |config|

  # MySQL Server
  config.vm.define "mysql" do |mysql|
    mysql.vm.box = "ubuntu/jammy64"
    mysql.vm.hostname = "mysql-server"
    mysql.vm.network "private_network", ip: "192.168.56.10"
    mysql.vm.provision "shell", path: "mysql_setup.sh"
  end

  # WordPress Server
  config.vm.define "wordpress" do |wordpress|
    wordpress.vm.box = "ubuntu/jammy64"
    wordpress.vm.hostname = "wordpress-server"
    wordpress.vm.network "private_network", ip: "192.168.56.11"
    wordpress.vm.provision "shell", path: "wordpress_setup.sh"
  end

end
