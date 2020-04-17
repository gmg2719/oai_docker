#
# Basic dockerfulfile for running the latest develop branch of OAI 
#

FROM ubuntu:16.04
LABEL maintainer="studioscws@gmail.com" 

RUN apt update && apt install -y \
	linux-image-lowlatency \
	linux-headers-lowlatency \
	git
RUN git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git
WORKDIR cmake_targets
CMD [ "source", "../oaienv" ]
CMD [ "./build_oai", "-I" ]
CMD [ "./build_oai", "-h" ]



