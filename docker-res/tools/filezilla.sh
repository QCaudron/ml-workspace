#!/bin/sh

INSTALL_ONLY=0
# Loop through arguments and process them: https://pretzelhands.com/posts/command-line-flags
for arg in "$@"; do
    case $arg in
        -i|--install) INSTALL_ONLY=1 ; shift ;;
        *) break ;;
    esac
done

if ! hash filezilla 2>/dev/null; then
    echo "Installing Filezilla"
    apt-get update
    apt-get install --yes filezilla
else
    echo "Filezilla is already installed"
fi

# Run
if [ $INSTALL_ONLY = 0 ] ; then
    echo "Starting Filezilla"
    filezilla
    sleep 10
fi