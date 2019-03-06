#
# Elasticsearch HQ plugin Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV ES_HQ_VERSION v3.5.0

# Update & install packages for elasticsearch-hq
RUN apt-get update && \
    apt-get install -y wget python3 python3-pip

#Configure ES
RUN mkdir elasticsearch-HQ && \
    cd elasticsearch-HQ && \
    wget https://api.github.com/repos/ElasticHQ/elasticsearch-HQ/tarball/${ES_HQ_VERSION} -O ${ES_HQ_VERSION}.tar.gz && \
    tar xf  ${ES_HQ_VERSION}.tar.gz --strip-components=1 && \
    pip3 install -r requirements.txt

WORKDIR elasticsearch-HQ

EXPOSE 5000

CMD ["python3", "application.py"]
