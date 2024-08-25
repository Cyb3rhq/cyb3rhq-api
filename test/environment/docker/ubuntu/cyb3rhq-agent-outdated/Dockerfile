FROM ubuntu:latest

RUN apt-get update && apt-get install git curl apt-transport-https lsb-release gnupg2 -y && \
    curl -s https://packages.cyb3rhq.com/key/GPG-KEY-CYB3RHQ | apt-key add - && \
    echo "deb https://packages.cyb3rhq.com/3.x/apt/ stable main" | tee /etc/apt/sources.list.d/cyb3rhq.list && \
    apt-get update

RUN apt-get install cyb3rhq-agent=3.5.0-1 -y

COPY entrypoint.sh /scripts/entrypoint.sh
