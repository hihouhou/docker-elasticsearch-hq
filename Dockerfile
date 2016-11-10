#
# Elasticsearch HQ plugin Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV ES_VERSION elasticsearch-2.3.1
ENV NODE $node

# Update & install packages for graylog
RUN apt-get update && \
    apt-get install -y git python

#Configure ES
RUN git clone https://github.com/royrusso/elasticsearch-HQ.git
WORKDIR elasticsearch-HQ

EXPOSE 8000 8000

CMD ["python", "-m", "SimpleHTTPServer", "8000"]
