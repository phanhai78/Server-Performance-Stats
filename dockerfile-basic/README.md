### Basic Dockerfile
---
In this project, you will write a basic Dockerfile to create a Docker image. When this Docker image is run, it should print “Hello, Captain!” to the console before exiting.
---
Ensure you have Docker installed on your machine. You can download and install Docker from [here](https://www.docker.com/products/docker-desktop/)
1 Clone repository 
```
git clone https://github.com/phanhai78/Server-Performance-Stats.git
cd dockerfile-basic
```
2 Build the Docker image:
```
docker build -t hello-captain .
```
3 Run docker container
```
docker run hello-captain
```
4 Output
```
Hello, Captain!
```
Project URL This is a local Docker project from the roadmap.sh, You can find the project details[here](https://roadmap.sh/projects/basic-dockerfile)