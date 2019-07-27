# Docker CI - Continuous integration with docker containers

## Basic architecture
![Architecure](./documentation/architecture.png)

## Launching the CI environments

To launch the CI environment, first make sure to take down the container if it already exists:

```bash
docker-compose --file docker-compose.yml down
```

Then run:

```bash
docker-compose --file docker-compose.yml up -d
```

## Accessing the containers
This project includes a Bash script to simplify the `docker exec` syntax for connecting to containers as the root user.

Here are some useful examples:
```bash
# Run Bash commands in the Jenkins container
./dexec.sh docker-ci-jenkins bash

# Run Bash commands in the SonarQube container
./dexec.sh docker-ci-sonarqube bash

# Run Bash commands in the Nginx container
./dexec.sh docker-ci-nginx bash
```


## Changing the Nginx configuration
To sync the config project config file from your project to the container (copy file to container and reload config):
```bash
docker cp nginx.conf docker-ci:/etc/nginx/conf.d/docker-ci.conf && ./dexec.sh docker-ci "nginx -s reload"
```
