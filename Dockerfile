FROM binfalse/jekyll
MAINTAINER martin scharm

# doing all in once to get rid of the useless stuff
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    git \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/* /var/cache/*


VOLUME ["/jekyll"]
WORKDIR /jekyll

COPY jekyll-update /usr/local/bin/jekyll-update
ENTRYPOINT ["/usr/local/bin/jekyll-update"]
