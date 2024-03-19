
### Prothemeus server

> wget https://github.com/prometheus/prometheus/releases/download/v2.51.0-rc.0/prometheus-2.51.0-rc.0.linux-amd64.tar.gz
> tar -xvzf prometheus-2.51.0-rc.0.linux-amd64.tar.gz -C prometheus-installation
> export PATH=$PATH:$(pwd)/prometheus-installation/prometheus-2.51.0-rc.0.linux-amd64/
> source ~/.profile

Create a sample config file prometheus.yml
```
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ["localhost:9090"]
```
Run prometheus with this config:

> prometheus --config.file=prometheus.yml

### Node exporter


Install and add node exporter to path

> wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
> tar -xvzf node_exporter-1.7.0.linux-amd64.tar.gz -C prometheus-installation
> export PATH=$PATH:$(pwd)/prometheus-installation/node_exporter-1.7.0.linux-amd64/
> source ~/.profile

Node exporter will collect server metrics and expose on port 9100

### Python server

Create python virtual environment
> python -v venv .venv
> source .venv/Scripts/active

Run python

> pip install -r requirement.txt 
> python server.python

Check http://localhost:8000 to view metrics

For more information about Python exporter, access this link: https://prometheus.github.io/client_python/getting-started/three-step-demo/


### Add node_exporter and python server to targets

Add sections to prometheus.yml file, it will look like this
```
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ["localhost:9090"]
  - job_name: node_exporter
    static_configs:
      - targets: ["localhost:9100"]
  - job_name: python_server
    static_configs:
      - targets: ["localhost:8000"]
```