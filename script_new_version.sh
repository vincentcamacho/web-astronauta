#!/bin/bash
registro=$1
imagen=$2
version=$3
contenedor=neo

# --------- COMANDOS DOCKER -----------
docker stop $contenedor
docker rm $contenedor
docker rmi $registro/$imagen:'latest'

cd ~/ts/web-astronauta/
docker build -t $registro/$imagen:$version .
docker tag $registro/$imagen:$version $registro/$imagen:'latest'

#cat ~/mi_contrasena.txt | docker login -u vincenup --password-stdin
docker login -u "vincenup" -p "85c91b79-68d8-496a-89d2-470d97fff5a6" docker.io

docker push $registro/$imagen:$version
docker push $registro/$imagen:'latest'

docker rmi $registro/$imagen:$version
docker rmi $registro/$imagen:'latest'

docker run -d --name $contenedor -p 8085:80 $registro/$imagen:'latest'