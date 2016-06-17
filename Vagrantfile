# -*- mode: ruby -*-
# vi: set ft=ruby :
update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo apt-get update 
  touch /tmp/up
fi
SCRIPT

# device = ENV['VAGRANT_BRIDGE'] || 'eth0'

Vagrant.configure("2") do |config|

  config.vm.box = 'ubuntu-16.04_puppet-3.8.7' 
  # config.vm.network :public_network, :bridge => device , :dev => device
  config.vm.hostname = 'smokeping.local'
  config.vm.provider 'libvirt'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
  end

  config.vm.provider :libvirt do |domain, o|
    domain.uri = 'qemu+unix:///system'
    domain.host = "smokeping.local"
    domain.memory = 2048
    domain.cpus = 2
    domain.storage_pool_name = 'default'
    o.vm.synced_folder './', '/vagrant', type: 'nfs'
  end


  config.vm.provision :shell, :inline => update
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file  = 'default.pp'
    puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera.yaml'
  end

end
