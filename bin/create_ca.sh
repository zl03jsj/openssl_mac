ca_root="./zl_ca/"
ca_pri="${ca_root}private/"
ca_new="${ca_root}newcerts/"

if [ ! -d "${ca_pri}" ]; then  
    mkdir -p "${ca_pri}"
fi

if [ ! -d "${ca_new}" ]; then  
    mkdir "${ca_new}"
fi

# mkdir -p ./zl_ca/private ./zl_ca/newcerts
touch ${ca_root}index.txt
echo 01 > ${ca_root}serial
./openssl genrsa -des3 -out ${ca_pri}/zl_ca.key 2048
./openssl req -new -days 3650 -key ${ca_pri}/zl_ca.key -out ${ca_root}zl_ca.csr
./openssl ca -selfsign -in ${ca_root}zl_ca.csr -out ${ca_root}zl_ca.crt
./openssl pkcs12 -export -inkey ${ca_pri}zl_ca.key -in ${ca_root}zl_ca.crt -out ${ca_root}zl_ca.pfx
