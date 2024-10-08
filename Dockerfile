#!/bin/bash build.sh
FROM debian
RUN sed -i 's/ main/ main contrib non-free security/g' /etc/apt/sources.list.d/* && \
  apt-get update -y && \
  apt-get install -y libmp3lame0 libmp3lame-dev gcc git g++ python3 python3-pip libtool pkg-config cmake && \ 
  rm -rf /var/lib/apt/lists
RUN cd / && git clone --recurse-submodules -j8 https://github.com/netham45/screamrouter.git && echo 12
RUN pip3 install -r /screamrouter/requirements.txt --break-system-packages
RUN ln -s /screamrouter/config/config.yaml /screamrouter/config.yaml
RUN cd /screamrouter/c_utils && ./build.sh
CMD cd /screamrouter && ./screamrouter.py
