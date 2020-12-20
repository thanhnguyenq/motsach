FROM gitpod/workspace-full-vnc

# Install Electron dependencies.
RUN sudo apt-get update \
 && sudo apt-get install -y \
  libasound2-dev \
  libgtk-3-dev \
  libnss3-dev \
 && sudo rm -rf /var/lib/apt/lists/*

# Fetch Windows 95 image
RUN cd /tmp \
 && wget -Owindows95.deb https://github.com/felixrieseberg/windows95/releases/download/v2.0.0/windows95-linux-2.0.0_amd64.deb \
 && mkdir windows95 \
 && dpkg-deb -R windows95.deb windows95 \
 && cp windows95/usr/lib/windows95/resources/app.asar.unpacked/src/images/windows95.img /home/gitpod \
 && rm -rf /tmp/windows95.deb /tmp/windows95