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

RUN git clone https://gitlab.eurecom.fr/oai/openairinterface5g.git 
WORKDIR openairinterface5g
CMD [ "source", "./oaienv" ]

CMD [ "./cmake_targets/build_oai", "-I" ]
CMD [ "./cmake_targets/build_oai", "-h" ]



