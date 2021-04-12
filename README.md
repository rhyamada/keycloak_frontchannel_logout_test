### Requirements

* git
* maven
* jdk
* docker
* docker-compose

### Running tests

Open a terminal and run

```bash

git clone https://github.com/rhyamada/keycloak_frontchannel_logout_test.git

cd keycloak_frontchannel_logout_test

./run_test.sh

```

Then open protected apache page browser at https://localhost . It should query for login, its admin:admin

Also Keycloak account page on new tab at http://localhost:8081/auth/realms/master/account

Click `Sign Out` button

Test refreshing apache page, should be queried for login again.


### Useful urls

Admin url: http://localhost:8081/auth/admin
Admin clients url: http://localhost:8081/auth/admin/master/console/#/realms/master/clients


### References
* [Keycloak](https://github.com/keycloak/keycloak)
* [OpenID Connect Front-Channel Logout 1.0 - draft](https://openid.net/specs/openid-connect-frontchannel-1_0.html)
* [zmartzone/mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)
* [My Keycloak fork](https://github.com/rhyamada/keycloak)
