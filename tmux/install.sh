#/bin/bash

BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#Patching open, pbcopy, etc on MacOSX
brew install reattach-to-user-namespace

