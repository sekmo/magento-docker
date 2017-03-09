# Docker image for Magento 1.9

> Magento version: 1.9.2.4

Built on [alexcheng](https://github.com/alexcheng1982/docker-magento "alexcheng")'s image, added sendmail support.
For development, fun and test purpose only, it lacks essential support for production deployment.
(The true story is that a friend of mine asked for a hand out with some magento crappy things, and I was curious to try out docker.)

## What's inside?

* A `Dockerfile` which output image is pushed to `sekmo/magento` on dockerhub (it runs supervisor to start apache and sendmail on the same container)
* A `htdocs` folder (stuffed with Magento files) and a (empty) `mysql` folder for persistence
* A `docker-compose.yml` conf file that runs the images `sekmo/magento` and `mysql 5.6.23`
* A `host-set.sh` script which is run by supervisor (it just sets the /etc/hosts file on the magento container to run sendmail)
* An `env` file which contains some environments variable (mysql user and password)
* A `usr_local_etc_php` directory with a working `php.ini`



## How to use

Clone the repo, cd to the directory and run `docker-compose` to start the apache and mysql containers in one shot

```bash
docker-compose up -d
```

Stop the containers with
```bash
docker-compose down
```


## Persistence

While volume containers should be used for persistence, I preferred to keep things easy and just link the htdocs and mysql folder to the docker host.



## Other notes

I exposed the 3306 port of the mysql container just because it's handy using something like Sequel Pro to connect to the container.
(it's not required by the magento container since it's linked through the docker internal network)
