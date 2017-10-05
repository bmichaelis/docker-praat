FROM alpine

MAINTAINER Nay San nay.san@anu.edu.au

ENV PRAAT_VER v6.0.33
ENV PRAAT_VER_NUM 6033

RUN apk add --update curl tar ca-certificates openssl \
	&& update-ca-certificates \
	&& wget https://github.com/praat/praat/releases/download/${PRAAT_VER}/praat${PRAAT_VER_NUM}_linux64barren.tar.gz \
	&& tar xzf praat${PRAAT_VER_NUM}_linux64barren.tar.gz -C /usr/bin \
	&& rm praat${PRAAT_VER_NUM}_linux64barren.tar.gz
copy scripts/ /tmp/praat/scripts/

ENTRYPOINT ["praat_barren"]
