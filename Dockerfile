FROM alpine:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget gnupg2 software-properties-common

# Install java-common and other dependencies
RUN apt-get install -y java-common

# Download and install Amazon Corretto 21
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.deb && \
    dpkg -i amazon-corretto-21-x64-linux-jdk.deb && \
    rm amazon-corretto-21-x64-linux-jdk.deb

# Install Maven
RUN apk add maven && export PATH=${PATH}:${JAVA_HOME}/bin

# Install Bash and GitHub
RUN apk add bash && apk add git

COPY setCredentials.sh /data/setCredentials.sh
