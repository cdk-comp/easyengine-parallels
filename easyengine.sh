#! /bin/bash


function myecho()
{
	echo =========================================================	
}

sudo echo -e "[user]\n\tname = vagrant-ee\n\temail = ee@vagrant.test" > ~/.gitconfig

myecho

wget -qO ee rt.cx/ee && sudo bash ee || exit 1

myecho

sudo ee stack install || exit 1

myecho

sudo ee site create 0.test --html || exit 1

myecho

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
sudo touch /var/lib/cloud/instance/locale-check.skip

sudo touch ~/.profile
sudo echo "export LC_ALL=en_US.UTF-8" > ~/.profile
sudo echo "export LANG=en_US.UTF-8" >> ~/.profile
sudo mv ~/.profile /var/www
sudo chown www-data:www-data /var/www/.profile

myecho

sudo mkdir /var/www/.ssh && sudo chown www-data:www-data /var/www/.ssh
sudo touch /var/www/.ssh/id_rsa /var/www/.ssh/id_rsa.pub /var/www/.ssh/authorized_keys
sudo chown www-data:www-data /var/www/.ssh/* && sudo chmod 600 /var/www/.ssh/*
sudo chsh -s /bin/bash www-data

myecho

sudo curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin || exit 1
sudo mkdir /var/www/.cache && sudo chown www-data:www-data /var/www/.cache

myecho

sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar || exit 1
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info

myecho

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install gtop -g

sudo npm i yarn -g
sudo touch /var/www/.yarnrc && sudo chown www-data:www-data /var/www/.yarnrc
sudo touch /var/www/.yarn && sudo chown www-data:www-data /var/www/.yarn

sudo npm i gulp -g

myecho



