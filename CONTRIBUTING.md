## Contributors guide

### Setup

Please go over the setup instructions and pre-requisties information at this link -> [Nitro - Getting Started](https://nitro.corp.apple.com/showcase/get-started)

### Build & Run

Nitro library is located in {workspaceDirectory}/nitro. Nitro showcase is located at {workspaceDirectory}/showcase. Showcase application internally uses the Nitro library, so all the changes to Nitro library, can be tested by running showcase application.

1. Build the library and watch for changes, in a terminal

```ts
npm run start:lib
```

2. And start the local angular server for showcase application in an another terminal

```ts
npm start
```

3. Load the browser and go to `localhost:4200` to load the showcase application

### Commit

We follow conventional commits specification to make sure, our commits are descriptive. [Read more about conventional commits here](https://www.conventionalcommits.org/en/v1.0.0/#summary)

1. Run `npm run commit`

### Pull request

Merging pull-request checklist:

- [ ] Verify changes in showcase
- [ ] Update the code snippets in showcase
- [ ] Update documentation in showcase

Once merged, our pipeline will push a release to npm.apple.com and Github PIE.

### CI/CD pipeline

Our CI/CD pipeline on PIE compute does the following:

1. Builds both nitro library and showcase
2. Deploys the showcase app to PIE compute host
3. (Work in progress) Automated nitro package publishing to npm.apple.com

To verify a release, you can view the build logs in Rio by visiting [https://compute.pie.apple.com/workspaces/nitro/pipelines](https://compute.pie.apple.com/workspaces/nitro/pipelines?repo=nitro-pst-nitro) and search for the project in question.

### Set npm config registry to Apple(Optional)

Set your project's npm registry to Apple's private npm repository by doing, either one of the below steps.

1. Issue the below commands

```ts
npm config set registry https://artifacts.apple.com/api/npm/npm-private/
npm config set strict-ssl false
```

2. Create a `.npmrc` file at your project root, with the below lines

```ts
registry="https://artifacts.apple.com/api/npm/npm-private/"
strict-ssl=false
```

## npm publish (only for admins)

1. **Get artifactory API key**
   Go to https://artifacts.apple.com/webapp/#/profile and click on the "Show API Key" icon. And copy the API key.

2. **Update NPM user level config using the ~/.npmrc file.**
   1.1 Use curl with your AppleConnect username:
   `curl -u <appleConnect_username> https://npm.apple.com/auth`

   1.2 Use your Artifactory API key:
   `Enter host password for user 'Appleconnect_username':`

You will get:

```
_auth=<token>
email=my.email@apple.com
always-auth=true
```

1.3 Add these to your ~/.npmrc file:

```
strict-ssl=false
always-auth = false
_auth = {getFromArtifactory}
email = {yourEmailAddress}@apple.com
```

3. **Prepare the package for publishing**
   Go to the root folder of nitro git repo.

   3.1 Build the angular library nitro

```sh
npm run build nitro
```

3.2 Copy all the source files from nitro source to dist folder

```sh
cp -an ./nitro/src/ ./dist/nitro/
```

3.3 Go into the dist folder, and rename the npm package name from nitro to @pst/nitro

```sh
npm i -g json
cd ./dist/nitro
json -I -f package.json  -e 'this.name="@pst/nitro"'
```

3.4 Bump up the package version

3.5 Publish the package to npm private registry at `https://artifacts.apple.com/api/npm/pst-npm-local/`

```sh
npm publish
```

## (Extra) Using npm link for advanced local development workflow

1. Build nitro library
   1.1 Go into the `nitro` repo, and run `ng build nitro`
2. Copy static files such as SCSS and Font files into the built `dist` folder
   2.1 Run `npm run copy-files:lib` to copy all the static files
3. Rename the dist package to @scoped format - `@pst/nitro`
4. go to dist/nitro folder and create sym link
   4.1 cd dist/nitro
   4.2 `npm link`
5. Move to main parent project create sym link
   5.1 remove `@pst/nitro` from package.json
   5.2 `npm link @pst/nitro`
