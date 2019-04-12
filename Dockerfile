FROM buildpack-deps:xenial
MAINTAINER csardas gan <csardas@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
Workdir /opt

RUN apt-get update -y \
 && apt-get upgrade -y \
 \
 # Download and install wkhtmltopdf
 && apt-get install -y fonts-noto-cjk \
 && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb \
 && apt-get install -y ./wkhtmltox_0.12.5-1.xenial_amd64.deb \
 \
 # cleanup unused pagkage files
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
