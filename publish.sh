#!/bin/sh bash

npm install -g json
cp -an ./nitro/src/ ./dist/nitro/
cd ./dist/nitro
json -I -f package.json  -e 'this.name="@pst/nitro"'
npm version prelease
npm publish

// npm view @pst/nitro versions

// rsync -avm --include='*.scss' -f 'hide,! */' ./nitro/src/ ./dist/nitro/