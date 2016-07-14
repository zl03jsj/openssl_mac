ca_prikey="./zl_ca/private/zl_ca.key"
ca_crt="./zl_ca/zl_ca.crt"

usrroot="./usercerts/"
key="$usrroot"zl.key
csr="$usrroot"zl.csr
crt="$usrroot"zl.crt
pfx="$usrroot"zl.pfx

if [ ! -d "${usrroot}" ]; then
    mkdir "$usrroot"
fi

./openssl genrsa -des3 -out "$key" 1024
./openssl req -new -key "$key" -out "$csr"
./openssl ca -in "$csr" -out "$crt" -cert "$ca_crt" -keyfile "$ca_prikey"
./openssl pkcs12 -export -inkey "$key" -in "$crt" -out "$pfx"

