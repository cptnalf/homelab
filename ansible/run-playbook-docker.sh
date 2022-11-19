#!/bin/bash

if [  -z "$SSH_AUTH_SOCK" ]; then
  echo "need to start ssh-agent"
  echo "eg: tick ssh-agent tick"
  exit
fi

docker run --rm -it --name ansible-run \
  -v $(pwd):/ansible \
  -v ~/.ssh/id_ecdsa:/root/.ssh/id_ecdsa \
  -v ~/.ssh/known_hosts:/root/.ssh/known_hosts \
  -v ~/.ansible:/root/.ansible \
  -v ${SSH_AUTH_SOCK}:/root/ssh-agent-file \
  -e SSH_AUTH_SOCK=/root/ssh-agent-file \
  --workdir=/ansible \
  willhallonline/ansible:2.10-bullseye-slim \
  ansible-playbook -u chiefengineer $@

# -i prod_1.yml base.yml 