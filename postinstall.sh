#!/bin/sh bash

if [ "$RIO_BUILD_ID" != "" ]; then
   echo "Rio build started"
   # node ./version-bump.js
   npm run lint:lib || exit 1
   echo "Linting completed"
   # npm install -g @angular/cli json
   # /workspace/node_modules/@angular/cli/bin/ng build nitro
   # /workspace/node_modules/@angular/cli/bin/ng build --prod --source-map --outputHashing=all --base-href=/showcase/ --deploy-url=/showcase/
   ng --version
   echo "Angular CLI install completed"
   npm run build:lib || exit 1
   echo "Nitro build completed"
   npm run build:showcase || exit 1
   echo "Nitro showcase build completed"
else
   echo "Non rio build"
fi

npm --prefix ./nitro install