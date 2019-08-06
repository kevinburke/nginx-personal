$(HOME)/var/nginx:
	mkdir -p $(HOME)/var/nginx

serve: $(HOME)/var/nginx cert.pem
	sudo nginx -c $(PWD)/nginx.conf

cert.pem:
	go run "$$(go env GOROOT)/src/crypto/tls/generate_cert.go" --host=localhost:443,127.0.0.1:443 --ecdsa-curve=P256 --ca=true

generate_cert: cert.pem
