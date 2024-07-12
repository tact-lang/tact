#!/usr/bin/env sh

# Call the script with a new dev version as its argument.
# If the argument is not provided a new version will be
# automatically generated from package.json and current date,
# plus a gitHead field with the current Git commit hash
# will be added to package.json.
# 
# The version format should be as follows:
# <MAJOR>.<MINOR>.<PATCH>-dev.<ISO-8601-DATE-WITHOUT-DELIMITERS>
# e.g. something like 1.4.0-dev.20240711

FILE=package.json
COMMIT=$(git rev-parse HEAD)

if [ ! -f "$FILE" ]; then
    echo "Error: $FILE not found!"
    exit 1
fi

VERSION=$1
if [ -z "$VERSION" ]; then
    VERSION=$(jq -r '.version' $FILE)-dev.$(date +"%Y%m%d")
fi

TMP=$(mktemp)
jq ".version = \"$VERSION\" | .gitHead = \"$COMMIT\"" "$FILE" > "$TMP"
mv "$TMP" "$FILE"
rm "$TMP"
yarn prettier -w "$FILE"

