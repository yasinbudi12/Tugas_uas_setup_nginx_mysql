
#!/bin/bash


		  sudo apt update
                  sudo apt install nginx git -y
                  sudo add-apt-repository universe
                  sudo cp default /etc/nginx/sites-available/default
                  sudo systemctl restart nginx
                  sudo cp index.html /var/www/html/index.html
