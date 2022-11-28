#!/bin/bash
db_user="postgres"
db_hostname="localhost"
db_database="info_db"
db_password="password"

echo "Username OR Email: "
read user

echo "Password: "
read password

#regex goes here

#inserting into the database
psql -U $db_user -h $db_hostname -d $db_database -c "INSERT INTO username (email, password) VALUES ('$user', '$password')"