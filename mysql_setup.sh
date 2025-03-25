#!/bin/bash

# Update and install MySQL Server
sudo apt update -y
sudo apt install mysql-server -y

# Secure MySQL installation (you can customize these settings)
sudo mysql_secure_installation <<EOF
n
y
y
y
y
EOF

# Create WordPress database and user
sudo mysql -e "CREATE DATABASE wordpress;"
sudo mysql -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Bind MySQL to listen on all interfaces
sudo sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL
sudo systemctl restart mysql
sudo systemctl enable mysql

echo "MySQL setup completed!"
