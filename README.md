# Lucidwallet

## A Frontend for Fluxwallet

![wallet landing](https://github.com/MorningLightMountain713/lucidwallet/blob/main/static/images/wallet_landing.png?raw=true)

## Features

* Full graphical wallet in your terminal
* Browser support coming soon
* Works over ssh with full copy paste (even headless)
* Flux native wallet (other chains coming soon)
* Optionally encrypt keys
* Send / receive transactions
* Sign messages (login to home.runonflux.io)
* Create wallet / import from mnemonic
* Uses Websocket to subscribe for latest blocks

## Quickstart

Once install run from a terminal:

```bash
lucidwallet
```

## Installation

Requires Python 3.10 or greater. If you don't have Python 3.10 - use the docker image (see below)

### macOS

Prerequisites:

`gmp`

```bash
brew install gmp
```

Install:

```bash
python3 -m pip install lucidwallet
```

A note on macOS terminal, it is recommended that you use `ITerm2`, native terminal works, however you need to modify some settings. See [here](https://github.com/Textualize/textual/blob/main/questions/why-looks-bad-on-macos.question.md) if you plan on using `Terminal.app`

### Ubuntu 22.04 (comes standard with Python 3.10)

Prerequisites:

`libgmp-dev`

```bash
sudo apt-get update && apt-get install python3-pip libgmp3-dev
```

Install:

```bash
python3 -m pip install lucidwallet
```

Source your profile to pick up new bin folder (or restart terminal)

```bash
source ~/.profile
```

### Windows

*** NOT TESTED YET ***

### Docker

Usage notes:

Performance takes a bit of a hit on docker (especially on macOS) You can try virtiofs for faster mounts. See [here](https://www.docker.com/blog/speed-boost-achievement-unlocked-on-docker-desktop-4-6-for-mac/)

However, docker lucidwallet is the easiest to install.

If you want to store the db in between runs, mount a db dir

```bash
docker run -v $(pwd)/database/:/database --rm -it megachips/lucidwallet:latest
```

This will create a `database` folder in your current directory, and the container will store database files there
