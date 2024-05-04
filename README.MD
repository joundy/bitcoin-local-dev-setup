
## Setup
  
This setup is used for local bitcoin development using the regtest network.\
*NOT recommended to run on mainnet/testnet because some components are fragile, especially for the ord server.

## How to Run
- Optional, build ord, electrs, btc-rpc-explorer image `docker/podman build -t <image_name> -f <dockerfile>`
- Optional, set the built image inside the compose file for services: ordinals-ord, blockstream-electrs, janoside-btc-rpc-explorer.
- Run the compose file `docker/podman compose up -d`

## Default
### Ports
| components | port |
|--|--|
| bitcoin | 18443 |
| ord | 3032 |
| electrs-electrum | 60401 |
| electrs-rest | 3002 |
| btc-rpc-explorer | 3000 |

### Auth
bitcoin user: `user` \
bitcoin password: `password` \
you can change it on `.env` file.

## Components
### bitcoin core
https://github.com/ruimarinho/docker-bitcoin-core \
Bitcoin core.
### ord
https://github.com/joundy/ordinals-ord, forked from https://github.com/ordinals/ord \
Ord server for indexing inscriptions and runes.\
API list: https://github.com/joundy/ordinals-ord/blob/master/src/subcommand/server.rs#L181
### electrs
https://github.com/joundy/blockstream-electrs forked from https://github.com/Blockstream/electrs \
*Blockstream version of https://github.com/romanz/electrs \
This is an electrum server, on blockstream version they added some rest api and also did optimizations for public usage.\
Rest API docs: https://github.com/blockstream/esplora/blob/master/API.md \
Electrum docs: https://electrum.readthedocs.io/en/latest/jsonrpc.html
### btc-rpc-explorer
https://github.com/joundy/janoside-btc-rpc-explorer forked from https://github.com/janoside/btc-rpc-explorer \
A lightweight bitcoin explorer, the dashboard is very straightforward and simple enough to see the details of bitcoin transactions. additionally, it also supports per-user address transactions using the electrum API.

## TODOs
- make it more configurable.
