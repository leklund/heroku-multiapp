# heroku multi-app plugin

Run commands on multiple apps with ease.

for example:

`heroku multiapp info`

will run `heroku info` for all heroku apps on your account.

`heroku multiapp info --account myaccount --multiapps app1,app2`

will run for only the two apps in the comma separated list passed to the 
multiapps options.

##TODO

* other option to implement might be `--exclude-apps` and `--dry-run`
* some documentation might be nice

