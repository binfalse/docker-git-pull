# Docker:Git-Pull

A Docker image helps you keeping Git-Projects up-to-date.
Just mount your Project into the container and latest changes will be pulled automatically.
You can optionally mount scripts that will be run before or after a pull.


## What it does

The [Dockerfile](https://github.com/binfalse/docker-git-pull/blob/master/Dockerfile) compiles into a Docker image that is based on a [slim version of Debian's testing image](https://hub.docker.com/_/debian/).
In addition, it has Git installed.

The image defines a volumn `/git-project`, where your Git porject should be mounted.
Thus a typical command line call would look like:

    docker run --rm -v /path/to/project:/git-project binfalse/git-pull

When you run such a container, it will run the script [git-pull](https://github.com/binfalse/docker-git-pull/blob/master/git-pull).
This script tries to update the project mounted at `/git-project`.


You can also mount two optional scripts to setup the environment before/after a pull:

* `/pre-pull` will be run if `git fetch` indicates new commits on the remote, but before `git pull` is executed
* `/post-pull` will be run after a `git pull`


### Pulling from SSH repositories

This image allows to pull through SSH, but this needs a bit more action.
You need to mount a properly configured SSH directory into root's home in the container.
This directory needs:

1. a password-less SSH key
2. a `known_hosts` file, that has already seen the remote host

To create such an SSH directory, you could do the following:

1. Create an empty directory:

    mkdir /PATH/TO/SSHDIR

2. Spawn a shell in a container with the dir mounted to /root/.ssh:

    docker run --rm -it -v /path/to/project:/git-project -v /PATH/TO/SSHDIR:/root/.ssh --entrypoint /bin/bash binfalse/git-pull

3. Create an SSH-Deploy key

    ssh-keygen -b 4096

4. Just leave all the questions empty (no passphrase!)

5. Configure your repository to allow read access for your new key `/PATH/TO/SSHDIR/id_rsa.pub` (or `/root/.ssh/id_rsa.pub` from within the container)

6. From the spawned container run `git pull` and accept the fingerprint of the remote server





Having this `/PATH/TO/SSHDIR` setup properly, you can now run:

    docker run --rm -v /path/to/project:/git-project -v /PATH/TO/SSHDIR:/root/.ssh binfalse/git-pull

to update the repository :)



In case of questions and doubts [just contact me](https://binfalse.de/contact/).. :)

## LICENSE

	Docker Image for a Docker:Git-Pull.
	Copyright (C) 2009-2017 Martin Scharm <https://binfalse.de/contact/>

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
