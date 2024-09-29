FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    openjdk21 \
    maven \
    curl \
    bash

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install Bash and GitHub
RUN apk add bash && apk add git

COPY setCredentials.sh /data/setCredentials.sh
