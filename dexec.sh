container_id=$(docker ps | grep $1 | cut -d " " -f 1 | head -1)
if [ "$container_id" = "" ]; then
    echo "Container <"$1"> does not exist"
    exit
fi
docker exec -it --user root $container_id $2
