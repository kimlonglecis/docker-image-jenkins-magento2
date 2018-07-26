#   Objectives:
    ##  1.  Install devtutspace/jenkins-master from docker hub
    ##  2.  Image include composer and utility tools.
    ##  3.  Install php-ext required by Magento 2

##  1.  Install devtutspace/jenkins-master from docker hub
FROM devtutspace/jenkins-master:latest

##  3.  Install php-ext required by Magento 2

USER root
RUN requirements="php-zip php-gd php-curl php-intl php-xml php-mbstring php-soap php-bcmath mcrypt php-mcrypt php-mysql" && \
    apt update && \
    apt autoremove && \
    apt autoclean && \
    apt install -y $requirements && \
    rm -rf /var/lib/apt/lists/*
USER jenkins
WORKDIR /var/jenkins_home/

## Docker image name:                           jenkins-php7-magento2
## Docker Hub Image Name:                       devtutspace/jenkins-php7-magento2
## Docker Image Build command:                  docker build -t jenkins-php7-magento2 ./
## Docker Image Build No Cache command:         docker build --no-cache -t jenkins-php7-magento2 ./
## Docker Image Tag command:                    docker tag jenkins-php7-magento2 devtutspace/jenkins-php7-magento2
## Docker Image Push command:                   docker push devtutspace/jenkins-php7-magento2