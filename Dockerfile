FROM openjdk:8-jre-slim
LABEL maintainer="Hannes de Jager <hannes.de.jager@gmail.com>"

RUN echo "deb http://deb.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list.d/bullseye-backports.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -t bullseye-backports -y install \
  libreoffice-common \
  python3-uno \
  unoconv \
  hyphen-af hyphen-en-us \
  fonts-dejavu fonts-dejavu-core fonts-dejavu-extra \
  fonts-droid-fallback fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation \
  fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa fonts-opensymbol && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 8100

CMD /usr/bin/libreoffice --headless --nologo --nofirststartwizard --accept="socket,host=0.0.0.0,port=8100;urp"

