#!/bin/bash

# Environmental variables
XC_ARCH="$WERCKER_GOX_ARCH"
XC_OS="$WERCKER_GOX_OS"
XC_LDFLAGS="$WERCKER_GOX_LDFLAGS"
XC_OUTPUT="$WERCKER_GOX_OUTPUT"

XC_ARCH=${XC_ARCH:-386 amd64 arm}
XC_OS=${XC_OS:-darwin linux windows freebsd openbsd netbsd plan9}

OUTPUT="{{.OS}}_{{.Arch}}/{{.Dir}}"
XC_OUTPUT=${XC_OUTPUT:-$OUTPUT}

gox \
    -os="${XC_OS}" \
    -arch="${XC_ARCH}" \
    -ldflags="${XC_LDFLAGS}" \
    -output "${WERCKER_OUTPUT_DIR}/pkg/${XC_OUTPUT}"

ls -l ${WERCKER_OUTPUT_DIR}/pkg
