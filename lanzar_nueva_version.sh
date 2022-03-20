#!/bin/bash
echo "TOTAL ARGUMENTOS: $#"
echo "Registro Contenedores = $1"
echo "Nombre de Aplicacion = $2"
echo "Nro. Version= $3"

registro=$1
app=$2
version=$3
contenedor=neo

docker stop $contenedor
docker rm $contenedor
docker rmi $registro/$app:'latest'

cd ~/cajita
docker build -t $registro/$app:$version .
docker tag $registro/$app:$version $registro/$app:'latest'

#cat ~/mi_contrasena.txt | docker login --username vincenup --password-stdin
docker login -u "vincenup" -p "85c91b79-68d8-496a-89d2-470d97fff5a6" docker.io

docker push $registro/$app:$version
docker push $registro/$app:'latest'

docker rmi $registro/$app:$version
docker rmi $registro/$app:'latest'

docker run -d --name $contenedor -p 8085:80 $registro/$app:'latest'