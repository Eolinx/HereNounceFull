echo "Cloning HereNounce..."
git clone https://github.com/Eolinx/HereNounce.git
cp ./HereNounce/.devops/docker/filesystem/app/loader.php ./HereNounce/loader.php

echo "Cloning Helix..."
git clone https://github.com/Eolinx/Helix.git
cp ./Helix/.devops/docker/filesystem/app/loader.php ./Helix/loader.php

cp .env-example .env
docker-compose --env-file=./.env up 