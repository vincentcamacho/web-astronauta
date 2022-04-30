#!/bin/bash
imagen=$1
contenedor=$2
version=$3

# --------- COMANDOS DOCKER -----------
docker stop $contenedor
docker rm $contenedor
docker rmi vincenup/$imagen:'latest'

cd ~/ts/codigo-html/
docker build -t vincenup/$imagen:$version .
docker tag vincenup/$imagen:$version vincenup/$imagen:'latest'

#cat ~/mi_contrasena.txt | docker login -u vincenup --password-stdin
docker login -u "vincenup" -p "85c91b79-68d8-496a-89d2-470d97fff5a6" docker.io

docker push vincenup/$imagen:$version
docker push vincenup/$imagen:'latest'

docker rmi vincenup/$imagen:$version
docker rmi vincenup/$imagen:'latest'

docker run -d --name $contenedor -p 8085:80 vincenup/$imagen:'latest'