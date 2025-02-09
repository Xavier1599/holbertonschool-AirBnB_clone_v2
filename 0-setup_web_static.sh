#!/usr/bin/env bash
# Sets up your web servers for the deployment of web_static
sudo apt-get -y update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

# Create folders
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create HMTL 
sudo touch /data/web_static/releases/test/index.html
echo "
<html>
 <head>
   <title>
   The title of your page
   </title>
 </head>
 
 <body>
   Your page content goes here.
 </body>
 </html>" > sudo /data/web_static/releases/test/index.html


sudo ln -sfn /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/


sudo sed -i '/listen 80 default_server/a location /hbnb_static/ {alias /data/web_static/current/;}' /etc/nginx/sites-available/default

sudo service nginx restart
