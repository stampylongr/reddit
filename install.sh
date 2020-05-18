# Install wget
sudo apt install wget -y

# Get custom packages
wget https://launchpad.net/~reddit/+archive/ubuntu/ppa/+files/cassandra_1.0.7-0ubuntu3_all.deb -O cass.deb
wget https://launchpad.net/~reddit/+archive/ubuntu/ppa/+files/stunnel4_4.53-1reddit1_amd64.deb -O stunnel.deb
wget https://launchpad.net/~reddit/+archive/ubuntu/ppa/+files/nodejs_6.9.4-1reddit1~trusty1_amd64.deb -O node.deb

sudo dpkg -i cass.deb stunnel.deb node.deb

# Install standard packages
sudo apt install -y \
    postgresql memcached rabbitmq-server haproxy \
    python-setuptools python-dev libmemcached-dev \
    libpq-dev libxml2-dev libxslt1-dev python-pil \
    git-core gcc optipng jpegoptim postgresql-client \
    make gettext python-pip python

# Install missing packages
sudo apt -f install -y

# Install Node.js packages
sudo npm i uglify-js less -g
