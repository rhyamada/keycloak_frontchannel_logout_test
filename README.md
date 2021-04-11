### Running tests

On conole terminal run

```bash
git clone https://github.com/rhyamada/keycloak_frontchannel_logout_test.git
cd keycloak_frontchannel_logout_test
./run_test.sh
```

Open protectes apache page browser at https://localhost

Should query for login, its admin admin

Open Keycloak account page on tab at https://localhost:8081/auth/realms/master/account

Click `Sign Out` button

Refresh apache apache, should be queried for login again.
