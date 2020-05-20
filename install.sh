# Install wget
sudo apt install wget -y

# Get custom packages
wget https://launchpad.net/~reddit/+archive/ubuntu/ppa/+files/stunnel4_4.53-1reddit1_amd64.deb -O stunnel.deb
wget https://launchpad.net/~reddit/+archive/ubuntu/ppa/+files/nodejs_6.9.4-1reddit1~trusty1_amd64.deb -O node.deb

sudo dpkg -i stunnel.deb node.deb

# Install standard packages
sudo apt install -y \
    postgresql memcached rabbitmq-server haproxy \
    python-setuptools python-dev libmemcached-dev \
    libpq-dev libxml2-dev libxslt1-dev python-pil \
    git-core gcc optipng jpegoptim postgresql-client \
    make gettext python-pip python libsnappy-dev

# Install missing packages
sudo apt -f install -y

# Install Node.js packages
sudo npm i uglify-js less -g

# l2cs install because it needs it and i don't want to deal with removing it
git clone https://github.com/kemitche/l2cs $HOME/repos/l2cs
sudo python $HOME/repo/l2cs/setup.py install

# pylibmc install
git clone https://github.com/lericson/pylibmc $HOME/repos/pylibmc
sudo python $HOME/repos/pylibmc/setup.py install

# cassandra repo
echo deb http://debian.datastax.com/community stable main | sudo tee /etc/apt/sources.list.d/cassandra.sources.list
wget -qO- -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
sudo apt install cassandra=1.2.19 -y
apt-mark hold cassandra || true
sudo service cassandra start
echo "Waiting for cassandra to be available..."
while ! nc -vz localhost 9160; do
    sleep 1
done
