# Docker: Jekyll w/ Git

A Docker image that is able to compile jekyll pages stored in Git repositories at, e.g., GitHub.

## What it does

The [Dockerfile](https://github.com/binfalse/docker-jekyll-git/blob/master/Dockerfile) compiles into a Docker image that is based on my other [Docker image binfalse/jekyll](https://hub.docker.com/r/binfalse/jekyll/) ([source](https://github.com/binfalse/docker-jekyll)).
It basically consists of a [Debian image](https://hub.docker.com/_/debian/) plus

* git
* ruby-dev
* pygments
* jekyll including the plugins
 * [jekyll-paginate](https://jekyllrb.com/docs/pagination/)
 * [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)
 * [jekyll-minifier](https://github.com/digitalsparky/jekyll-minifier/issues)

In addition, it has a volume `/jekyll` configured, where your jekyll porject should be mounted.

When run, the container executes the script [jekyll-update](https://github.com/binfalse/docker-jekyll-git/blob/master/jekyll-update), which checks whether the git repository inside the jekyll project is up-to-date (it tries to git-fetch new commits, so make sure you configured an origin with an HTTP(S) URL).
In case of updates on the remote repository, the container will integrate new commits and run 

    jekull build

to rebuild the website.


As you see, it's specifically entailed for my needs, but maybe other may learn from it.
In case of questions and doubts [just contact me](https://binfalse.de/contact/).. :)


## LICENSE

	Docker Image for Jekyll+Git
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
