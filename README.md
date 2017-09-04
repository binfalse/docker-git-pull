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
