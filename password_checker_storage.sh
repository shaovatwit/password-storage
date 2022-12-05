#!/bin/bash
db_user="postgres"
db_hostname="localhost"
db_database="info_db"
# db_password="password"

echo "Username OR Email: "
read user

echo "Password: "
read password

#regex goes here, also be sure to check this field is NOT empty.
if [[ ${#password} -ge 8 && "$password" == *[A-Z]* && "$password" == *[a-z]* && "$password" == *[0-9]* && "$password" == *['!@#$%&*^']* ]]
then

#creates extension for encrypting password if not exists.
# psql -U $db_user -h $db_hostname -d $db_database -c  "CREATE EXTENSION IF NOT EXISTS pgcrypto"

#create table if not exists in tables.sql file

#for pgpass file, host:port:db:user:pass
#chmod 600 pgpass
#export PGPASSFILE='/Users/vianne/Documents/GitHub/password-storage/.pgpass' - environmental variable

#encrypts password and stores into database
psql -U $db_user -h $db_hostname -d $db_database -c "INSERT INTO user_info (email, password) VALUES ('$user', crypt('$password', gen_salt('bf')))"
echo "Successfully inserted information into database."
#documentation used
#https://www.postgresql.org/docs/current/pgcrypto.html
else
printf "Invalid password!\n- At least 8 characters\n- At least one uppercase letter\n- At least one lowercase letter\n- At least one special character\n- At least one number\n"
fi