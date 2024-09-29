FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    unzip

# Set the version for Corretto
ENV CORRETTO_VERSION=21.0.0.5.1
ENV CORRETTO_HOME=/opt/corretto

# Download and install Amazon Corretto 21
RUN curl -L "https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.zip" -o corretto.zip && \
    unzip corretto.zip -d /opt && \
    mv /opt/amazon-corretto-21* $CORRETTO_HOME && \
    rm corretto.zip

# Set JAVA_HOME environment variable
ENV JAVA_HOME=$CORRETTO_HOME
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install Maven
RUN apk add --no-cache maven

# Install Bash and GitHub
RUN apk add bash && apk add git

COPY setCredentials.sh /data/setCredentials.sh
