#! /bin/sh

cd /git/repo && git --bare init
chown git:git /git/repo -R

mkdir -p /git/.ssh
touch /git/.hushlogin
cat /key > /git/.ssh/authorized_keys

mkdir /git/git-shell-commands
chown 987:987 /git/git-shell-commands
chmod 700 /git/git-shell-commands

chown 987:987 /git -R
chmod 600 /git/.ssh/authorized_keys

/etc/init.d/ssh restart
