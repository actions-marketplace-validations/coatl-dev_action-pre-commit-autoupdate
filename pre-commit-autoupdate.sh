#!/usr/bin/env bash

if [ -z "$2" ]; then
    while IFS='' read -r repo || [ -n "${repo}" ]; do
        pre-commit autoupdate --config "$1" --repo "$repo"
    done < <(grep -Eo 'https://[a-zA-Z0-9./?=_%:-]*' "$1")
else
    while IFS='' read -r repo || [ -n "${repo}" ]; do
        pre-commit autoupdate --config "$1" --repo "$repo"
    done < <(grep -Eo 'https://[a-zA-Z0-9./?=_%:-]*' "$1"| grep -iEwv "$2")
fi
