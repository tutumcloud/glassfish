#!/usr/bin/expect

set password [lindex $argv 0]

spawn asadmin enable-secure-admin
expect "admin"
send "admin\n"
expect "password"
send "$password\n"
expect eof
exit
