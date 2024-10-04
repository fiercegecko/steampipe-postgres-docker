FROM postgres:15

ENV TERM=xterm-256color
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        curl \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD steampipe_postgres_installer.sh /tmp/
RUN /tmp/steampipe_postgres_installer.sh aws latest && \
    rm /tmp/steampipe_postgres_installer.sh
    