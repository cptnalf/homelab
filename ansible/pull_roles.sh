#!/bin/bash

mkdir external_roles

pushd external_roles
git clone https://github.com/patrickjahns/ansible-role-promtail pratrickjahns.promtail

git clone https://github.com/bertvv/ansible-role-dhcp bertvv.dhcp

popd
