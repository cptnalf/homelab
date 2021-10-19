# Coral Dev Board Frigate setup
This is a role to setup a [Google Coral Dev Board](https://coral.ai/products/dev-board) with [frigate](https://docs.frigate.video).

see ../docker, ../docker-compose for augments.

## notes
so, knot-resolver doesn't recommend using the docker container for 'production' services.  this is why this is being installed as a normal package.

had to manually install the repo since 'mendel' isn't 'debian buster' (which it really is ;_;)
```${SUDO} wget -O /usr/share/keyrings/knot.gpg https://deb.knot-dns.cz/apt.gpg
${SUDO} sh -c 'echo "deb http://download.opensuse.org/repositories/home:/CZ-NIC:/knot-resolver-latest/Debian_10/ /" > /etc/apt/sources.list.d/knot-latest.list'
```

## todo
* traefik for https/http?
  use traefik-forward-auth + google-oauth for authentication.
  add in let's-encrypt for https (add subdomain, and pick a hostname? frigate?)
  
* wireguard setup to my house
* caching dns? maybe a subdomain? (knot-resolver/knot-dns)
  (could bypass knot-dns, use cloudflare as dns, put private ip in there)