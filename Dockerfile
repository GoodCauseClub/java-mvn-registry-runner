FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    tar \
    openjdk21 \
    maven

# Set the version for Corretto
ENV CORRETTO_VERSION=21.0.0.5.1
ENV CORRETTO_HOME=/opt/corretto

# Download and install Amazon Corretto 21
RUN curl -L "https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.tar.gz" -o corretto.tar.gz && \
    mkdir -p $CORRETTO_HOME && \
    tar -xzf corretto.tar.gz -C $CORRETTO_HOME --strip-components=1 && \
    rm corretto.tar.gz

# Set JAVA_HOME environment variable
ENV JAVA_HOME=$CORRETTO_HOME
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install Bash and GitHub
RUN apk add bash && apk add git

COPY setCredentials.sh /data/setCredentials.sh
