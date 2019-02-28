FROM ubuntu:bionic

RUN apt-get update && apt-get install -y curl && \
    curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash && \
    apt-get update && \
    apt-get install -y php7.2-phalcon && \
    apt autoremove -y && \
    apt clean -y && \
    rm -rf /tmp/* /var/tmp/* /etc/php/7.0 && \
    find /var/cache/apt/archives /var/lib/apt/lists -not -name lock -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f | while read f; do echo -n '' > ${f}; done

WORKDIR /app

EXPOSE 8080
