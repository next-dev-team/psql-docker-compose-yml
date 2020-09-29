# app.srv.usp.mongodb

MongoDB replica-set setup with docker for local and testing servers

## Run docker compose
$docker-compose up

This will run 3 docker containers, mongo, mongo2 and mongo3 and bind to replicaSet named 'rs0'

## Initialize master
On mongo, run command
$cat /docker-entrypoint-initdb.d/init-primary.sh | mongo

## Initialize slave
On both mongo2 and mongo3, run command:
$cat /docker-entrypoint-initdb.d/init-secondary.sh | mongo

## Update hosts file
In your local machine, add the following to hosts file to resolve all containers correctly
```code
127.0.0.1   mongodb
127.0.0.1	mongodb2
127.0.0.1	mongodb3
```

## Add user
Add connection for replica-set, login and add user root and other users