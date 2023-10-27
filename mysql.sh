#!/bin/bash

service mysql start

# MySQL root user credentials
DB_ROOT_USER="root"
DB_ROOT_PASS="123456789"

# New user details
NEW_USER="Kanthu"
NEW_USER_PASSWORD="123456789"

# Database name
NEW_DB_NAME="Kanthu"

# Check if the user already exists
if ! mysql -u $DB_ROOT_USER -p$DB_ROOT_PASS -e "SELECT User FROM mysql.user WHERE User='$NEW_USER'" | grep -q "$NEW_USER"; then
    # Create the user if it doesn't exist
    mysql -u $DB_ROOT_USER -p$DB_ROOT_PASS <<EOF
    CREATE USER '$NEW_USER'@'localhost' IDENTIFIED BY '$NEW_USER_PASSWORD';
    GRANT ALL PRIVILEGES ON *.* TO '$NEW_USER'@'localhost' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF
fi

# Check if the database already exists
if ! mysql -u $DB_ROOT_USER -p$DB_ROOT_PASS -e "SHOW DATABASES LIKE '$NEW_DB_NAME'" | grep -q "$NEW_DB_NAME"; then
    # Create the database if it doesn't exist
    mysql -u $DB_ROOT_USER -p$DB_ROOT_PASS -e "CREATE DATABASE $NEW_DB_NAME;"
fi

