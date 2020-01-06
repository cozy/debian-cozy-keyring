.PHONY: cozy-keyring.gpg cozy-nightly-keyring.gpg

cozy-keyring.gpg:
	gpg --export --no-armor 0x51F72B6A45D40BBE > $@
cozy-nightly-keyring.gpg:
	gpg --export --no-armor 0x33A051CC16F562D6 > $@

refresh: cozy-keyring.gpg cozy-nightly-keyring.gpg
