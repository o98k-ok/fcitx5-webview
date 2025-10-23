#!/bin/bash

function help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  fw, fcitx5-webview    Build fcitx5-webview"
    echo "  -h, --help            Show this help message"
    exit 0
}

if [[ $# -eq 0 ]]; then
    help
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        html)
            echo "building html template"
            pnpm run build
            shift
            ;;
        prepare)
            echo "preparing for fcitx5-webview build"
            npm i -g pnpm
            pnpm i
            shift
            ;;
        fw|fcitx5-webview)
            echo "starting fcitx5-webview build"
            cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
            cmake --build build
            shift
            ;;
        -h|--help)
            help
            ;;
        *)
            help
            ;;
    esac
done