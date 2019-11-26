PETSTORE_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' petstore)
cat > petstore-service.json <<EOF
{
  "ID": "petstore1",
  "Name": "petstore",
  "Address": "${PETSTORE_IP}",
  "Port": 8080
}
EOF

curl -v     -XPUT     --data @petstore-service.json     "http://127.0.0.1:8500/v1/agent/service/register"
