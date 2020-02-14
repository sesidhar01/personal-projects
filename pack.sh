#!/bin/bash

echo "Building nitro"

ng build nitro

echo "Building nitro ng-add schematics"

./node_modules/.bin/tsc -p ./nitro/tsconfig.schematics.json

echo "Copying schematics collection to dist"

cp ./nitro/schematics/collection.json ./dist/nitro/schematics/collection.json

rsync -avm --include='*.scss' -f 'hide,! */' ./nitro/src/ ./dist/nitro/

rsync -avm --include='*.md' -f 'hide,! */' ./nitro/ ./dist/nitro/

npm publish