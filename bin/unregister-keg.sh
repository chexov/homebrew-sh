#!/bin/sh
set -ue

BREW_HOME=/opt/homebrew

cellar=$1

find ${cellar} -mindepth 1 | while read item; do
    item_path=$(echo "${item}" | sed -e "s!${cellar}/!!g")
    b=$(basename "${item_path}")
    d=$(dirname "${item_path}")

    [ -f "${item}" ] && {
        echo rm -fdr "${BREW_HOME}/${item_path}"
    }
done

