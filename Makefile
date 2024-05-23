.PHONY: cozy-keyring.gpg noop

default: noop

noop:
	true

cozy-keyring.gpg:
	gpg --export --no-armor 0x51F72B6A45D40BBE > $@

refresh: cozy-keyring.gpg

release:
	DEBEMAIL="Cozycloud Packaging Team <debian@cozycloud.cc>" dch --newversion "$(shell date +"%Y%m%d.1")" "Extend keys"
	DEBEMAIL="Cozycloud Packaging Team <debian@cozycloud.cc>" dch --release --distribution stable ""

package:
	docker run --rm -i -t -v ./:/build debian:10 /build/build.sh
