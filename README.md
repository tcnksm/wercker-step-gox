Wercker step gox [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tcnksm/wercker-step-gox/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/f3f6f75dbda8ac556afa41d2d3eece3b/m "wercker status")](https://app.wercker.com/project/bykey/f3f6f75dbda8ac556afa41d2d3eece3b)

This is [wercker](http://wercker.com/) step for [mitchellh/gox](https://github.com/mitchellh/gox), cross-compile golang project.

## Usage

In the `wercker.yml` of your application use the following step definition:

```
steps:
    - tcnksm/gox
```

This step will generate binaries to `${WERCKER_OUTPUT_DIR}/pkg/{{.OS}}_{{.Arch}}/{{.Dir}}`.

## Options

You can control build with some option from `wercker.yml`:

```yaml
steps:
   - tcnksm/gox:
     os: "darwin linux windows" # OS to cross-compile
     arch: "386 amd64"          # ARCH to cross-compile
```

## Preferred Box

You should use below wercker-boxes which are already setup [mitchellh/gox](https://github.com/mitchellh/gox):

- [tcnksm/wercker-box-gox](https://github.com/tcnksm/wercker-box-gox)
- [motemen/wercker-box-golang-gox](https://github.com/motemen/wercker-box-golang-gox)

If you use wercker-box which is not installed [mitchellh/gox](https://github.com/mitchellh/gox), you need additional steps:

```yaml
steps:
    - script:
        name: install mitchellh/gox
        code: |
        go get -u -v github.com/mitchellh/gox
        sudo -E env PATH=$GOPATH/bin:$PATH gox -build-toolchain
```

## Author

[tcnksm](https://github.com/tcnksm)
