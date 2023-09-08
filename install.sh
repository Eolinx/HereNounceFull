echo "Cloning HereNounce..."
git clone https://github.com/Eolinx/HereNounce.git
cp -r ./HereNounce/.devops/docker/filesystem/app/. ./HereNounce/

echo "Cloning Helix..."
git clone https://github.com/Eolinx/Helix.git
cp -r ./Helix/.devops/docker/filesystem/app/. ./Helix/

cp .env-example .env
docker-compose up
#docker-compose --env-file=./.env up 