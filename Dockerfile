FROM ubuntu:16.04
MAINTAINER csardas gan <csardas@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list \
 && apt-get update -y \
 && apt-get upgrade -y \
 \
 # Download and install wkhtmltopdf
 && apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi \
 && wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb \
 && gdebi --n wkhtmltox_0.12.5-1.xenial_amd64.deb \
 \
 # cleanup unused pagkages
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
