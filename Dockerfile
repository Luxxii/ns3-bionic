FROM ubuntu:bionic

COPY install-ns3-bionic.sh $HOME/ns3/install-ns3-bionic.sh

WORKDIR $HOME/ns3

RUN apt-get update && \
    apt-get install -y sudo && \
    ./install-ns3-bionic.sh && \
    rm -rf /var/lib/apt/lists/*

WORKDIR $HOME/ns3/ns-allinone-3.31/ns-3.31

ENTRYPOINT ["/bin/bash", "-c"]

