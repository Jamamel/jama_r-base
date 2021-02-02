**Note**: This image is based on RStudio's: [rocker/r-ver](https://github.com/rocker-org/rocker-versioned) and underlying images.

**Note**: See the rocker-org/rocker-versioned2 repo for Dockerfile recipes for R >= 4.0.0


# Using the jamamel/jama_r-base container


## Quickstart

    docker run -it --name r_base jamamel/jama_r-base:3.6.3


## Common configuration options:


### Give the user root permissions (add to sudoers)

    docker run -d -p 8787:8787 -e ROOT=TRUE -e PASSWORD=yourpasswordhere jamamel/jama_rstudio:3.6.3

Link a local volume (in this example, the current working directory, `$(pwd)`) to the rstudio container:

    docker run -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=yourpasswordhere jamamel/jama_rstudio:3.6.3


#### Access a root shell for a running `rstudio` container instance

First, determine the name or id of your container (unless you provided a `--name` to `docker run`) using `docker ps`.  You need just enough of the hash id to be unique, e.g. the first 3 letters/numbers.  Then exec into the container for an interactive session:

    docker exec -ti <CONTAINER_ID> bash

You can now perform maintenance operations requiring root behavior such as `apt-get`, adding/removing users, etc.  

Or, simply enable root as shown above and use the RStudio bash terminal.


## Additional configuration options

- Custom user name: `-e USER=<CUSTOM_NAME>`
- Custom user id, group id, UMASK: `-e USERID=<UID>`, `-e GROUPID=<GID>`, `e UMASK=022`


Custom uid/gid etc is usually only needed when sharing a local volume for a user/group whose id does not match the default (`1000`:`1000`).  Failing to do this could make files change permissions on the linked volume when accessed from RStudio. 


Adding additional users:  From a root bash shell (see above), the usual debian linux commands can be used to create new users and passwords, e.g. 


## Developers / Dockerfile authors

The RStudio images use the `s6-init` system to run multiple/persistant jobs.  While init systems like supervisord are better known, `s6` is powerful, lightweight, easy to use, and plays nicely with docker (e.g. avoiding the pid 1 / zombie problem).  See [s6-overlay](https://github.com/just-containers/s6-overlay) for details if you need to add additional services (such as an sshd server) or custom start-up, shut down, or logging scripts.  


## More help

See the Wiki for additional documentation and use cases: <https://github.com/rocker-org/rocker/wiki>
