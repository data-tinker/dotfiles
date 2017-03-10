#!/usr/bin/env bash

# rm ~/vim.zip* 2>/dev/null; wget -O ~/vim.zip r.mytty.ru/vim.zip 1>/dev/null 2>&1 && yes A | unzip ~/vim.zip -d ~ 1>/dev/null 2>&1 && echo "success"; rm ~/vim.zip 2>/dev/null; rm "$(cd $(dirname $0); pwd -P)/$(basename $0)" 2>/dev/null

rm ~/vim.zip*
wget -O ~/vim.tar.gz r.mytty.ru/vim.tar.gz
tar -xzvf ~/vim.tar.gz --directory ~
rm ~/vim.zip 2>/dev/null;

# remove script
# rm "$(cd $(dirname $0); pwd -P)/$(basename $0)"

echo "success"
