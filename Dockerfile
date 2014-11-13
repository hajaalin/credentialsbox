from ubuntu:14.04

run apt-get update -y

# Setup home environment
run useradd -s /bin/bash dev
run mkdir /home/dev && chown -R dev: /home/dev

# Create a shared data volume 
# with placeholders for credential files.
run mkdir /var/shared
run touch /var/shared/.gitconfig
run mkdir /var/shared/.ssh
run touch /var/shared/.ssh/githubkey
run touch /var/shared/.ssh/githubkey.pub
add ssh_config /var/shared/.ssh/config

run chmod -R go-rx /var/shared/
run chown -R dev:dev /var/shared

volume /var/shared
