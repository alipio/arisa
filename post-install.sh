#!/usr/bin/env bash

set -e

sudo mkdir -p /etc/keyd
sudo cp ./assets/keyd.conf /etc/keyd/default.conf
pidof keyd &> /dev/null && sudo keyd reload

nvim --headless -c 'PlugUpdate|PlugClean!|qa'
