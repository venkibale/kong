#!/bin/bash

# Set database config from Heroku DATABASE_URL
if [ "$DATABASE_URL" != "" ]; then
    echo "Found database configuration in DATABASE_URL=$DATABASE_URL"

    regex='^postgres://([a-zA-Z0-9_-]+):([a-zA-Z0-9]+)@([a-z0-9.-]+):([[:digit:]]+)/([a-zA-Z0-9_-]+)$'
    if [[ $DATABASE_URL =~ $regex ]]; then
        export DB_HOST=${BASH_REMATCH[3]}
        export DB_PORT=${BASH_REMATCH[4]}
        export DB_DATABASE=${BASH_REMATCH[5]}
        export DB_USER=${BASH_REMATCH[1]}
        export DB_PASSWORD=${BASH_REMATCH[2]}
    fi

fi

export DB_ADAPTER=postgres
export DB_PG_SCHEMA=konga
export DB_SSL=true
