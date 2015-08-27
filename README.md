git-ssh-server
=================

A minimal GIT server with a built-in inited git repo

forked from https://github.com/unixtastic/git-ssh-server

Build instructions:
===================

git clone https://github.com/tmuskal/git-ssh-server

docker build -t 'tmuskal/git-ssh-server' .

Usage instructions:
===================

To run this first create a data directory on your docker host to hold git data, ssh authentication,
and possibly git-shell-commands.

Run the container.

docker run -d -p 2222:22 -v ~/.ssh/id_rsa.pub:/key tmuskal/git-ssh-server

or

docker run -d -p 2222:22 -v authorized_keys:/key tmuskal/git-ssh-server

You may substitute '2222' with any port number of your choosing.

Clone the repo from a client:

git clone ssh://git@myserver:2222/git/repo


Backup:
=======

docker run -d -p 2222:22 -v /repo:/git/repo -v ~/.ssh/id_rsa.pub:/key tmuskal/git-ssh-server


Notes:
======

The SSH host keys are generated at the first run of each new container. This will confuse some git clients and really should be changed.

