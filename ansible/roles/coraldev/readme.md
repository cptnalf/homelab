# Coral Dev Board Frigate setup
This is a role to setup a [Google Coral Dev Board](https://coral.ai/products/dev-board) with [frigate](https://docs.frigate.video).

see ../docker, ../docker-compose for augments.


## todo
* traefik for https/http?
  use traefik-forward-auth + google-oauth for authentication.
  add in let's-encrypt for https (add subdomain, and pick a hostname? frigate?)
  
* wireguard setup to my house
* caching dns? maybe a subdomain? (knot-resolver/knot-dns)
  (could bypass knot-dns, use cloudflare as dns, put private ip in there)