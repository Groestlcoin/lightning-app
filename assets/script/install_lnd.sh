#!/bin/sh

# create empty grsd.conf for grsctl
if [ "$(uname)" == "Darwin" ]; then
  PLATFORM="darwin"
  mkdir $HOME/Library/Application\ Support/Grsd && touch $HOME/Library/Application\ Support/Grsd/grsd.conf
else
  PLATFORM="linux"
  mkdir $HOME/.grsd && touch $HOME/.grsd/grsd.conf
fi

# install go
GO_DOWNLOAD="https://storage.googleapis.com/golang/go$GO_TAG.$PLATFORM-amd64.tar.gz"
curl -L $GO_DOWNLOAD | tar -xz
mv go $HOME

# install lnd
git clone https://github.com/Groestlcoin/lnd $GOPATH/src/github.com/Groestlcoin/lnd
cd $GOPATH/src/github.com/Groestlcoin/lnd
git checkout $LND_TAG
# enable mainnet neutrino in lnd
git fetch https://github.com/halseth/lnd.git mainnet-neutrino:mainnet-neutrino && git cherry-pick mainnet-neutrino
make && make install tags="experimental autopilotrpc signrpc walletrpc chainrpc invoicesrpc routerrpc"

# install grsd
git clone https://github.com/Groestlcoin/grsd $GOPATH/src/github.com/Groestlcoin/grsd
cd $GOPATH/src/github.com/Groestlcoin/grsd
git checkout $BTCD_TAG
GO111MODULE=on go install -v . ./cmd/...

# copy lnd/grsd binaries to git repo for integration tests
cp $GOPATH/bin/* $TRAVIS_BUILD_DIR/assets/bin/$PLATFORM/
