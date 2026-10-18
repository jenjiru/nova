#!/bin/bash

curl -LO https://raw.githubusercontent.com/jenjiru/nova/main/disko.nix

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./disko.nix

sudo nixos-generate-config --root /mnt
cd /mnt/etc/nixos
sudo rm configuration.nix
sudo curl -LO https://raw.githubusercontent.com/jenjiru/nova/main/configuration.nix
sudo nixos-install