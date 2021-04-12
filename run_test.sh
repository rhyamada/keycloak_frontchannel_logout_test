#!/bin/bash
set -e

docker-compose build
if [ ! -d "keycloak/.git" ]; then
    git clone https://github.com/rhyamada/keycloak.git
fi
# git -C keycloak pull
mvn -f keycloak/pom.xml clean install -DskipTests=true
mvn -f keycloak/testsuite/utils/pom.xml exec:java -Pkeycloak-server -Dkeycloak.bind.address=0.0.0.0 &

while  [ $(curl -sw "%{http_code}" -o /dev/null http://localhost:8081/auth/realms/master/) != "200" ]
do
    sleep 3
done

KC="http://localhost:8081/auth"

# Cria client no Keycloak
TOKEN=$(curl -s "$KC/realms/master/protocol/openid-connect/token" -d 'client_id=admin-cli&grant_type=password&username=admin&password=admin' | sed  -e 's/.*access_token":"\([^"]\+\).*/\1/')
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d @client.json "$KC/admin/realms/master/clients"

docker-compose up