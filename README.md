# Symfony2 Docker environment
To make things easier, this is using [Crane](https://github.com/michaelsauter/crane) to orchestrate the Docker containers.

## What's included?
The environment consists of 2 containers: the sample app (with PHP and Composer installed) served by Apache, and a MySQL database.

## Requirements
[Docker](https://github.com/dotcloud/docker) and [Crane](https://github.com/michaelsauter/crane). If you're on OS X and have no Docker environment setup yet, I recommend [docker-osx](https://github.com/noplay/docker-osx). [boot2docker](https://github.com/boot2docker/boot2docker) is nice, but unfortunately, it does not support bind-mounting volumes yet so it can't be used for this example. Overall, I recommend staying away from OS X completely at this stage and run everything from inside a Ubuntu VM.

## Usage
* `git clone git@github.com:michaelsauter/symfony2-crane-env.git`
* `cd symfony2-crane-env`
* To set file permissions correctly, the Docker container needs a user with the same ID as your user on the host. So, run this snippet: `echo "useradd -m -u $UID symfony" > apache-mysql-base/data/add_user.sh`
* `crane lift --verbose`

That will build the images and run the containers. Note that on the first run, the server container will need to install the dependencies. After all is done, you can access the app via `http://localhost:49080/app_dev.php`.