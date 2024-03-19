Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-20.04"
  config.vm.boot_timeout
  config.vm.network "forwarded_port", guest: 9090, host: 9090

  # file to run python server target
  config.vm.provision "file", source: "./requirement.txt", destination: "requirement.txt"
  config.vm.provision "file", source: "./server.py", destination: "server.py"

  # configuration file for prometheus server
  config.vm.provision "file", source: "./prometheus.yml", destination: "prometheus.yml"


  config.vm.provision "shell", path: "script.sh"

  # config.vm.provision "shell", inline: <<-SHELL
  # SHELL

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end
end
