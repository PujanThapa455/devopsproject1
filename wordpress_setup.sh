#!/bin/bash

# Update and install necessary packages
sudo apt update -y
sudo apt install apache2 php php-mysql libapache2-mod-php -y

# Download WordPress
wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz -C /var/www/html/
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo rm -rf /var/www/html/wordpress latest.tar.gz

# Configure permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Configure WordPress
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
sudo sed -i "s/username_here/wp_user/" /var/www/html/wp-config.php
sudo sed -i "s/password_here/password/" /var/www/html/wp-config.php

# Restart Apache
sudo systemctl restart apache2
sudo systemctl enable apache2

echo "WordPress setup completed! Access it at http://192.168.56.11"
