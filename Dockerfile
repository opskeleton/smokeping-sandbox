FROM phusion/baseimage:0.9.9

RUN apt-get update
RUN apt-get install wget -y
RUN /usr/bin/wget 'https://gist.githubusercontent.com/narkisr/6097786/raw' --no-check-certificate && /bin/bash raw
ADD pkg/smokeping-sandbox-0.0.2.tar.gz /
RUN cd smokeping-sandbox-0.0.2 && /bin/bash run.sh
RUN rm -rf smokeping-sandbox-0.0.2 

CMD ["/sbin/my_init"]
# CMD ["YOUR PROCESSES"]
# EXPOSE 80 514 12201 9200
