FROM ubuntu:20.04


RUN apt update && apt-get -y install transmission-cli transmission-common transmission-daemon

RUN service transmission-daemon stop
RUN mkdir -p /etc/transmission-daemon/
RUN sed -i 's/"rpc-whitelist": "127.0.0.1"/"rpc-whitelist": "*.*.*.*"/g' /etc/transmission-daemon/settings.json
RUN sed -i 's|"rpc-host-whitelist": ".*",|"rpc-host-whitelist": "inflated-rice-dev-qqpe.2.sg-1.fl0.io",|g' /etc/transmission-daemon/settings.json

EXPOSE 3000 7000 42069/tcp 42069/udp 5489/tcp 5489/udp 9091 51413/tcp 51413/udp

CMD ["transmission-daemon","-m","-f", "-g", "/etc/transmission-daemon/", "-u", "BricksConductor", "-v", "Riceinflates54@!"]
