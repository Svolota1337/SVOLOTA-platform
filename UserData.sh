#!/bin/bash
sudo apt install nginx -y
sudo mkdir /data && sudo mkdir /data/www
sudo wget https://gist.githubusercontent.com/chrisvfritz/bc010e6ed25b802da7eb/raw/18eaa48addae7e3021f6bcea03b7a6557e3f0132/index.html
sudo mv index.html /data/www
sudo cd /etc/nginx
sudo cat <<EOL > /etc/nginx/nginx.conf
# nginx.conf configuration
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    server {
        listen 80 default_server;
        server_name _;
        
        location / {
            root /data/www;
            index index.html;
        }
    }
}
EOL
sudo nginx -s reload
