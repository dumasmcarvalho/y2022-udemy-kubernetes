Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 4
    vb.name = "ubuntu_bionic_kubernetes"
  end

  config.vm.define "kubernetes" do |kubernetes|
    kubernetes.vm.network "private_network"

    kubernetes.vm.provision "shell", 
    inline:'apt-get update && \
      apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
      sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
      apt-get -y install docker-ce && \
      sudo systemctl enable docker && \
      sudo usermod -aG docker vagrant && \
      curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
      sudo chmod +x kubectl && \
      sudo mv kubectl /usr/local/bin/ && \
      curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
      sudo install minikube-linux-amd64 /usr/local/bin/minikube && \
      minikube config set driver docker && \
      apt-get upgrade -y'
  end

end