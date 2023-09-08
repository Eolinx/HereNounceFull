echo "Cloning HereNounce..."
git clone https://github.com/Eolinx/HereNounce.git
cp -r ./HereNounce/.devops/docker/filesystem/app/. ./HereNounce/

echo "Cloning Helix..."
git clone https://github.com/Eolinx/Helix.git
cp -r ./Helix/.devops/docker/filesystem/app/. ./Helix/

cp .env-example .env
docker-compose up -d
#docker-compose --env-file=./.env up 

docker exec -t herenouncefull_herenounce_1 /bin/bash -c "cd /app && php /root/composer.phar install"
docker exec -t herenouncefull_helix_1 /bin/bash -c "cd /app && php /root/composer.phar install"