#!/bin/bash
db_user="postgres"
db_hostname="localhost"
db_database="info_db"
db_password="password"

echo "Username OR Email: "
read user

echo "Password: "
read password

#regex goes here, also be sure to check this field is NOT empty.

#creates extension for encrypting password if not exists.
# psql -U $db_user -h $db_hostname -d $db_database -c  "CREATE EXTENSION IF NOT EXISTS pgcrypto"

#create table if not exists


#encrypts password and stores into database
psql -U $db_user -h $db_hostname -d $db_database -c "INSERT INTO user_info (email, password) VALUES ('$user', crypt('$password', gen_salt('bf')))"

#documentation used
#https://www.postgresql.org/docs/current/pgcrypto.html