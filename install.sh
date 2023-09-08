#!/bin/bash
echo "HereNounce auto install"
read -p "Enter current node hostname: " hostname

export HERENOUNCE_HOSTNAME=hostname

echo "Cloning HereNounce..."
git clone https://github.com/Eolinx/HereNounce.git
cp -r ./HereNounce/.devops/docker/filesystem/app/. ./HereNounce/

echo "Cloning Helix..."
git clone https://github.com/Eolinx/Helix.git
cp -r ./Helix/.devops/docker/filesystem/app/. ./Helix/

echo "Starting Docker containers"
#cp .env-example .env
docker-compose up -d
#docker-compose --env-file=./.env up 

docker exec -t herenouncefull_herenounce_1 /bin/bash -c "cd /app && php /root/composer.phar install"
docker exec -t herenouncefull_helix_1 /bin/bash -c "cd /app && php /root/composer.phar install"

echo "Herenounce application install"
docker exec -it herenouncefull_herenounce_1 /bin/bash -c "cd /app && php ./index.php install -e"

echo "Herenounce Helix install"
docker exec -it herenouncefull_helix_1 /bin/bash -c "cd /app && php ./index.php install -e"