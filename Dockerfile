FROM alpine:latest

RUN apk update && apk add --no-cache \
    openjdk21 \
    maven \
    bash \
    curl \

ENV PATH="${PATH}:${JAVA_HOME}/bin"

# Install Bash and GitHub
RUN apk add bash && apk add git

COPY setCredentials.sh /data/setCredentials.sh
