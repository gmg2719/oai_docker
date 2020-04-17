# OAI eNB
# 
# VERSION 0.0.1

FROM ubuntu:18.04
LABEL maintainer="studioscws@gmail.com" 

RUN apt-get update && apt-get install -y \
	#linux-image-lowlatency \
	#linux-headers-lowlatency \
	# >looks like docker does not care about the underlying kernel!
	# >but OAI still does,,, so you should follow their instructions
	git \ 
	# >just to get the ./build_OAI script to run
	sudo

#fixes protobuf compiler crash
RUN adduser oai && adduser oai sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER oai
WORKDIR /home/oai
RUN git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git 
#&& git checkout develop
WORKDIR /home/oai/openairinterface5g
CMD [ "source", "./oaienv" ]

CMD [ "/home/oai/openairinterface5g/cmake_targets/build_oai", "-I","--eNB", "-w USRP" ]
CMD [ "/home/oai/openairinterface5g/cmake_targets/lte_build_oai/build/lte-softmodem" ]



