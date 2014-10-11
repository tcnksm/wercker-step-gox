#!/bin/bash

# Environmental variables 
XC_ARCH="$WERCKER_GOX_ARCH"  
XC_OS="$WERCKER_GOX_OS"

XC_ARCH=${XC_ARCH:-386 amd64 arm}
XC_OS=${XC_OS:-darwin linux windows freebsd openbsd netbsd plan9}

gox \
    -os="${XC_OS}" \
    -arch="${XC_ARCH}" \
    -output "${WERCKER_OUTPUT_DIR}/pkg/{{.OS}}_{{.Arch}}/{{.Dir}}"

ls -l ${WERCKER_OUTPUT_DIR}/pkg
