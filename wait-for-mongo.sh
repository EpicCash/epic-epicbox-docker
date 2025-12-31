#!/bin/sh
# wait-for-mongo.sh
# Wait until MongoDB is ready for authenticated connections

set -e

host="$1"
user="$2"
pass="$3"
db="$4"

until mongo "$host/$db" --username "$user" --password "$pass" --authenticationDatabase "$db" --eval "db.stats()" >/dev/null 2>&1; do
  echo "Waiting for MongoDB to be ready..."
  sleep 2
done

echo "MongoDB is ready!"
