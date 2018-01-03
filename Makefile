serve:
	sudo nginx -c $(PWD)/nginx.conf

generate_cert:
	go run "$$(go env GOROOT)/src/crypto/tls/generate_cert.go" --host=localhost:443,127.0.0.1:443 --ecdsa-curve=P256 --ca=true
