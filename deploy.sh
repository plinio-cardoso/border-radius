#!/usr/bin/env sh

# abort on errors
set -e

# setting up locale
rm -rf .env.local
echo 'VUE_APP_LOCALE='$1 > .env.local

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
echo 'border-radius.pliniocardoso.ie' > CNAME

git init
git add -A
git commit -m 'deploy'

# deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:plinio-cardoso/border-radius.git master:gh-pages

cd ../
rm -rf .env.local

cd -
