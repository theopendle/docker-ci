# Docker CI - Continuous integration with docker containers

## Basic architecture
![Architecure](./documentation/architecture.png)

## Running the project
To launch the CI environment, first make sure to take down the containers if they already exists:
```bash
docker-compose --file docker-compose.yml down
```
Then run:
```bash
docker-compose --file docker-compose.yml up -d
```
You can access the GUIs at:
* Jenkins: http://localhost/jenkins
* SonarQube: http://localhost/sonarqube


#### Without NGinX
If you want to run the project without the NGinX server (if for example you already have a reverse proxy on your machine) you can do so like this:
```bash
docker-compose --file docker-compose.yml up jenkins sonarqube
```
You will have to use port numbers to access the GUIs:
* Jenkins: http://localhost:8085/jenkins
* SonarQube: http://localhost:9000/sonarqube

## Accessing the containers
This project includes a Bash script to simplify the `docker exec` syntax for connecting to containers as the root user:

`./dexec.sh <container-name> <command>`

Here are some useful examples:
```bash
# Run Bash commands in the Jenkins container
./dexec.sh docker-ci-jenkins bash

# Run Bash commands in the SonarQube container
./dexec.sh docker-ci-sonarqube bash

# Run Bash commands in the Nginx container
./dexec.sh docker-ci-nginx bash
```


## Changing the NGinX configuration
To sync the config project config file from your project to the container (copy file to container and reload config):
```bash
docker cp nginx.conf docker-ci:/etc/nginx/conf.d/docker-ci.conf && ./dexec.sh docker-ci "nginx -s reload"
```
