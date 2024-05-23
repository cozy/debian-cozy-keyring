# Cozy keyring package builder

To build a new package with extended key process with the following steps

## Extend key lifetime

```bash
$ gpg --edit-key B44072EBDE14FC828F69F20651F72B6A45D40BBE
gpg (GnuPG) 2.2.27; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

sec  rsa4096/51F72B6A45D40BBE
     created: 2017-09-27  expires: 2027-05-23  usage: SC  
     trust: unknown       validity: unknown
[ unknown] (1). Cozy Debian signing key

gpg> expire
Changing expiration time for the primary key.
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 3y
Key expires at dim. 23 mai 2027 14:32:05 CEST
Is this correct? (y/N) y

sec  rsa4096/51F72B6A45D40BBE
     created: 2017-09-27  expires: 2027-05-23  usage: SC  
     trust: unknown       validity: unknown
[ unknown] (1). Cozy Debian signing key

gpg> save
```

## Export key

```bash
$ make refresh
gpg --export --no-armor 0x51F72B6A45D40BBE > cozy-keyring.gpg
```

## Create new package version and changelog

```bash
$ make release
DEBEMAIL="Cozycloud Packaging Team <debian@cozycloud.cc>" dch --newversion "20240523.1" "Extend keys"
DEBEMAIL="Cozycloud Packaging Team <debian@cozycloud.cc>" dch --release --distribution stable ""
```

## Build package

either automatically in debian 12 docker container or manually

### With docker

```bash
make package
```

### Manually

```bash
dpkg-buildpackage -us -uc -b
```
