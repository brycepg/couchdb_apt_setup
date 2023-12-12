FROM ubuntu:22.04

EXPOSE 22

RUN apt-get update && apt-get install -y openssh-server
COPY --chown=root:root authorized_keys /root/.ssh/authorized_keys
RUN chmod 0644 /root/.ssh/authorized_keys
ENTRYPOINT service ssh start && bash
