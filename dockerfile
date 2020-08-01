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
  && install2.r --error \
    --deps TRUE \
    renv

RUN R -e "renv::consent(provided = TRUE)"