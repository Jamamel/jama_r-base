![Build Push jama_r-base v3.6.3](https://github.com/Jamamel/jama_r-base/workflows/Build%20Push%20jama_r-base%20v3.6.3/badge.svg)

**Note**: This image is based on RStudio's: [rocker/r-ver](https://github.com/rocker-org/rocker-versioned) and underlying images.

**Note**: See the rocker-org/rocker-versioned2 repo for Dockerfile recipes for R >= 4.0.0


# Using the jamamel/jama_r-base container


## Quickstart

    docker run -it --name r_base jamamel/jama_r-base:3.6.3


## Common configuration options:


### Give the user root permissions (add to sudoers)

    docker run -it -e ROOT=TRUE --name r_base jamamel/jama_r-base:3.6.

Link a local volume (in this example, the current working directory, `$(pwd)`) to the rstudio container:

    docker run -it -v $(pwd):/home/rstudio --name r_base jamamel/jama_r-base:3.6.


#### Access a root shell for a running `jama_r-base` container instance

First, determine the name or id of your container (unless you provided a `--name` to `docker run`) using `docker ps`.  You need just enough of the hash id to be unique, e.g. the first 3 letters/numbers.  Then exec into the container for an interactive session:

    docker exec -ti <CONTAINER_ID> bash

You can now perform maintenance operations requiring root behavior such as `apt-get`, adding/removing users, etc.  

## More help

See the Wiki for additional documentation and use cases: <https://github.com/rocker-org/rocker/wiki>
