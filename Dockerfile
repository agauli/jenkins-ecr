FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y git cron awscli curl jq ca-certificates \
    && curl -s -L $(curl -s https://api.github.com/repos/barnybug/cli53/releases/latest | jq -r '.assets[].browser_download_url' | grep cli53-linux-amd64) -o /usr/bin/cli53 \
    && chmod +x /usr/bin/cli53

RUN mkdir /scripts
