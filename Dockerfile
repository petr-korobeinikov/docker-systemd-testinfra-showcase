# syntax=docker/dockerfile:1

FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN <<EOF
apt update

apt install -y --no-install-recommends \
    openssh-server \
    sudo \
    gnupg \
    systemd \
    python3

useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
echo 'ubuntu:ubuntu' | chpasswd

service ssh start
EOF

COPY gdraheim/docker-systemctl-replacement/systemctl3.py /usr/bin/systemctl
COPY gdraheim/docker-systemctl-replacement/journalctl3.py /usr/bin/journalctl

RUN chmod +x /usr/bin/systemctl /usr/bin/journalctl

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
