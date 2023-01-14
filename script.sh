#!/bin/bash

echo "Criando as imagens..."

sudo docker build -t marioavcastro/projeto-backend:1.0 backend/.
sudo docker build -t marioavcastro/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

sudo docker push marioavcastro/projeto-backend:1.0
sudo docker push marioavcastro/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml