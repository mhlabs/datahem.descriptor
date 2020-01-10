FROM debian:stretch
ARG VERSION=3.7.1
RUN apt-get update \
  && apt-get install -y wget unzip \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/protoc-${VERSION}-linux-x86_64.zip \
  && unzip protoc-${VERSION}-linux-x86_64.zip -d protoc3 \
  && cp -r protoc3/bin/* /usr/local/bin/ \
  && cp -r protoc3/include/* /usr/local/include/
COPY descriptor.sh /
ENTRYPOINT ["bash", "/descriptor.sh"]