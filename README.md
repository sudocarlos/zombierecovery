# zombierecovery

A repo describing steps to recover a zombie channel between lnd and cln nodes

See https://github.com/lightninglabs/chantools/pull/154  
See https://github.com/lightninglabs/chantools/blob/master/doc/zombierecovery.md

## Dependencies

- Docker
- Docker Compose

## Build

	curl https://raw.githubusercontent.com/sudocarlos/zombierecovery/refs/heads/main/build.sh | sh

## Download binary using cURL

```
# Download the precompiled binary
curl -SL https://github.com/sudocarlos/zombierecovery/releases/download/0.1/chantools -o chantools

# Set execute file permission
chmod +x chantools
```

## Get hsm_secret hex from Core Lightning node on Start9

- SSH to your Start9

		ssh start9@192.168.0.123

- Get hsm_secret hex from Core Lightning

	⚠️ **This will expose the private key of your Core Lightning node. DO NOT SHARE** ⚠️

		sudo podman exec -it c-lightning.embassy xxd -p -c32 --show-secrets /root/.lightning/bitcoin/hsm_secret

	- Example output:

			05b00234df4e0224fc0aeadafef92bb64cc9394913953b61352cca04727678aa

- Generate an on-chain Bitcoin address to use with `--payout_addr` in the next command
- Use the string hsm_secret string from the previous comamnd in `chantools zombierecovery preparekeys`

		./chantools zombierecovery preparekeys \
		--hsm_secret 05b00234df4e0224fc0aeadafef92bb64cc9394913953b61352cca04727678aa \
		--payout_addr bc1qmtk0m0rxgpv7fpk5evyn6ntr9rd2q57avqtlp5 \
		--match_file match.json
