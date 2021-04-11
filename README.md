### Running tests

On console terminal run

```bash

git clone https://github.com/rhyamada/keycloak_frontchannel_logout_test.git

cd keycloak_frontchannel_logout_test

./run_test.sh

```

Open protected apache page browser at https://localhost

It should query for login, its admin:admin

Open Keycloak account page on new tab at https://localhost:8081/auth/realms/master/account

Click `Sign Out` button

Refresh apache apache, should be queried for login again.


### References
* [OpenID Connect Front-Channel Logout 1.0 - draft](https://openid.net/specs/openid-connect-frontchannel-1_0.html)
* [zmartzone/mod_auth_openidc](https://github.com/zmartzone/mod_auth_openidc)
* [My Keycloak fork](https://github.com/rhyamada/keycloak)
