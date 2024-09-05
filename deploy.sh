#!/bin/bash

echo "## Welcome to deployment ##"

# Install and start Nginx
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl status nginx --no-pager

# Clone the repository and move files
cd /home/waseem/
git clone https://github.com/MuhammadWaseem29/Task-01.git
cd Task-01/
sudo cp -r * /var/www/html/

echo "## End ##"

