

echo "Creating volume"
docker volume create nwdb-vol
echo "Creating network"
docker network create mynet

echo "Creating db"
docker run -d --network mynet -v nwdb-vol:/var/lib/mysql --name nwdb stackupiss/northwind-db:v1

# pause to allow db to be ready
sleep 15

echo "Creating app"
docker run -d -p 8080:3000 --network mynet -e DB_HOST=nwdb -e DB_USER=root -e DB_PASSWORD=changeit \
    --name nwapp stackupiss/northwind-app:v1