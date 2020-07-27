#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
cd $SCRIPT_PATH

has_xcode=$(xcode-select -p 1>/dev/null;echo $?)
if [ $has_xcode != "0" ]; then
    printf "You don't have command line tools installed, please install them\nthen rerun this script\n"
    exit 1
fi

function build_dyld_sharedcache_util(){
    xcodebuild -target dyld_shared_cache_uti  -sdk macosx11.0 -scheme dyld_shared_cache_util -configuration Debug -arch x86_64  ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$SCRIPT_PATH/build
}

mkdir build

build_dyld_sharedcache_util 