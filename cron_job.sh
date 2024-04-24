# Cleanup exited docker containers
EXITED_CONTAINERS=$(docker ps -a | grep Exited | awk '{ print $1 }')
if [ -z "$EXITED_CONTAINERS" ]
then
    echo "No exited containers to clean"
else
    docker rm $EXITED_CONTAINERS
fi
 
# renew certbot certificate
docker compose run --rm certbot
docker compose exec nginx nginx -s reload
