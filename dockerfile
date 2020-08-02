FROM rocker/r-ver:3.6.3

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  libsasl2-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  # install Java (dependencies for rJava)
  default-jre \
  default-jdk  \
  libbz2-dev \
  && R CMD javareconf \
  && apt-get -y --no-install-recommends install \
  r-cran-rjava \
  libgdal-dev \
  libproj-dev \
  # install renv as part of base install
  && install2.r --error \
    --deps FALSE \
    renv