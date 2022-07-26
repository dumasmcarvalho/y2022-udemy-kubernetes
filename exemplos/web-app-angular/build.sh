#!/bin/bash

# Limpar arquivos de build anteriores e compilar novamente.
kubectl delete -f deployment.yml & docker rmi --force web-app-angular
rm -rf node_modules dist
npm install
npm run ng -- build --base-href /web-app-angular

# Alterar o Docker padrão para o Minikube utilizar o registry local.
minikube docker-env
eval $(minikube -p minikube docker-env)

# Compilar uma imagem Docker a partir do app e subir no K8s.
docker build --no-cache -t web-app-angular .
kubectl create -f deployment.yml
minikube service web-app-angular --url

# Para subir a aplicação diretamente no Docker sem o K8s.
# docker run -dit --name web-app-angular -p 8080:8080 -v "${PWD}"/dist/web-app-angular/:/usr/local/apache2/htdocs -v "$PWD"/httpd/httpd.conf:/usr/local/apache2/conf/httpd.conf httpd:latest