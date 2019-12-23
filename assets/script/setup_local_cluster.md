## Start nodes via cli

```
grsd --txindex --simnet --rpcuser=kek --rpcpass=kek --datadir=data/grsd/data --logdir=data/grsd/logs

lnd --rpclisten=localhost:10006 --listen=localhost:10016 --restlisten=localhost:8086 --lnddir=data/lnd --debuglevel=info --groestlcoin.simnet --groestlcoin.active --groestlcoin.node=neutrino --neutrino.connect=127.0.0.1:18555

lncli --network=simnet --rpcserver=localhost:10006 --lnddir=data/lnd create

lnd --rpclisten=localhost:10002 --listen=localhost:10012 --restlisten=localhost:8002 --lnddir=data/lnd2 --debuglevel=info --groestlcoin.simnet --groestlcoin.active --groestlcoin.node=neutrino --neutrino.connect=127.0.0.1:18555

lncli --network=simnet --rpcserver=localhost:10002 --lnddir=data/lnd2 create
```

## Fund wallets addresses

```
lncli --network=simnet --rpcserver=localhost:10006 --lnddir=data/lnd newaddress np2wkh

grsd --txindex --simnet --rpcuser=kek --rpcpass=kek --datadir=data/grsd/data --logdir=data/grsd/logs --miningaddr=NEW_ADDRESS

grsctl --simnet --rpcuser=kek --rpcpass=kek generate 400
```

## Open channel and send payment

```
lncli --network=simnet --rpcserver=localhost:10002 --lnddir=data/lnd2 getinfo

lncli --network=simnet --rpcserver=localhost:10006 --lnddir=data/lnd connect PUB_KEY@localhost:10012

lncli --network=simnet --rpcserver=localhost:10006 --lnddir=data/lnd openchannel --node_key=PUB_KEY --local_amt=16000000

btcctl --simnet --rpcuser=kek --rpcpass=kek generate 6

lncli --network=simnet --rpcserver=localhost:10006 --lnddir=data/lnd listchannels

lncli --network=simnet --rpcserver=localhost:10002 --lnddir=data/lnd2 addinvoice --amt=10000

lncli --network=simnet --rpcserver=localhost:10006 --lnddir=data/lnd sendpayment --pay_req=ENCODED_INVOICE
```
