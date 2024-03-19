mkdir prometheus-installation

wget https://github.com/prometheus/prometheus/releases/download/v2.51.0-rc.0/prometheus-2.51.0-rc.0.linux-amd64.tar.gz
tar -xvzf prometheus-2.51.0-rc.0.linux-amd64.tar.gz -C prometheus-installation
export PATH=$PATH:$(pwd)/prometheus-installation/prometheus-2.51.0-rc.0.linux-amd64/
source ~/.profile

wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar -xvzf node_exporter-1.7.0.linux-amd64.tar.gz -C prometheus-installation
export PATH=$PATH:$(pwd)/prometheus-installation/node_exporter-1.7.0.linux-amd64/
source ~/.profile

# install pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
python3 -m pip install -r requirement.txt

# start node_exporter
node_exporter &

# start python server as prometheus target
python3 server.py &

# start prometheus server
prometheus --config.file=prometheus.yml

