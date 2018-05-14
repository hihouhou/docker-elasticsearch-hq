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
    apt-get install -y git python3 python3-pip

#Configure ES
RUN git clone https://github.com/ElasticHQ/elasticsearch-HQ.git
WORKDIR elasticsearch-HQ

#Install requirements
RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["python3", "application.py"]
#CMD ["python", "-m", "SimpleHTTPServer", "8000"]
