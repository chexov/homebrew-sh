#!/bin/sh
set -xue

BREW_HOME=/opt/

cellar=$1

find ${cellar} -mindepth 1 | while read item; do
    item_path=$(echo "${item}" | sed -e "s!${cellar}/!!g")
    b=$(basename "${item_path}")
    d=$(dirname "${item_path}")

    [ -d "${item}" ] && {
        mkdir -p "${BREW_HOME}/${item_path}"
    }
    [ -f "${item}" ] && {
        ln -s "${item}" "${BREW_HOME}/${item_path}"
    }
done

