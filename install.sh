#!/bin/bash

### env
VIMHOME=~/.vim
VIMFILE=~/.vimrc
PWD=`pwd`

### functions
warn() {
    echo "WARNING: $1" >&2
}

error() {
    echo "ERROR: $1" >&2
    exit 1
}

### begin
echo "installing vimrc in: $PWD ..."

#backup exists file/dir

echo "creating backup ..."

for f in $VIMHOME $VIMFILE; do
    if [ -e "$f" ]; then
        if [ -e "${f}_bak" ]; then
            rm -rf ${f}_bak || error "Can't remove exists backup file: ${f}_bak"
        fi
        mv $f ${f}_bak || error "Can't rename exists file: $f"
    fi
done

# link the files
echo "Create symbolic links ..."
ln -sf $PWD $VIMHOME
ln -sf $PWD/vimrc $VIMFILE
