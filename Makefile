.PHONY: cozy-keyring.gpg

cozy-keyring.gpg:
	gpg --export --no-armor 0x51F72B6A45D40BBE > $@

refresh: cozy-keyring.gpg

release:
	DEBEMAIL="Cozycloud Packaging Team <debian@cozycloud.cc>" dch --newversion "$(shell date +"%Y%m%d.1")" "Extend keys"
	DEBEMAIL="Cozycloud Packaging Team <debian@cozycloud.cc>" dch --release --distribution testing ""
