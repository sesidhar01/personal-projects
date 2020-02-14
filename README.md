[![pipeline status](https://badges.pie.apple.com/badges/rio?p=nitro-nitro-nitro&s=nitro-nitro-nitro-master-publish)](https://rio.apple.com/projects/nitro-nitro-nitro) [![#nitro on Slack](https://img.shields.io/badge/slack-nitro.svg?logo=slack)](slack://channel?team=TEJ6NBG84&id=GFBT6A49Y)

<p align="center">
	<img src="showcase/assets/logo/logo-main-black-new.png" alt="Nitro" width="523" height="125">
</p>

<br/>

Nitro design system offers a 3-in-1 solution to build consistent, scalable, reusable web applications.

### Nitro homepage

See more information at [Nitro showcase](https://nitro.corp.apple.com/)

### NPM package

[Nitro on Engweb](https://engweb.apple.com/npm/@pst/nitro)

### Install

```bash
$ npm install @pst/nitro --registry https://artifacts.apple.com/api/npm/npm-private/
```

### Usage

```ts
import { NitroModule } from '@pst/nitro';

@NgModule({
...
  imports: [
    ...
    NitroModule
  ],
...
})
export class AppModule { }
```

```scss
@import '~@pst/nitro/nitro';
```

```html
<nitro-button styleClass = "btn-primary">Primary</nitro-button>
```

### Dependencies

Before installing, please make sure, you have the following dependencies.

1. node.js (Recommended: Latest LTS version)
2. npm (Recommended: Latest LTS version)
3. @angular/cli
4. Install all the peer dependencies required. Please refer the `peerDependencies` object inside our `package.json`
5. Add the below paths to the paths attribute in tsconfig.json file.
   ```json
   {
       "paths": {
         "nitro": [
           "dist/nitro"
         ],
         "nitro/*": [
           "dist/nitro/*"
         ]
       }
     }
   }
   ```
6. (Extra) For using the forms component, please import both the `FormsModule` and `ReactiveFormsModule` from `@angular/forms`, like below.
   `import { FormsModule, ReactiveFormsModule } from '@angular/forms';`

### Contributing

See [Contributors' Guide](https://github.pie.apple.com/PST/nitro/blob/master/nitro/CONTRIBUTING.md)

### Changelog

See [Changelog](https://github.pie.apple.com/PST/nitro/blob/master/nitro/CHANGELOG.md)

### Important Links

- [Artifactory repository](https://artifacts.apple.com/webapp/#/artifacts/browse/tree/General/nitro-npm-local 'Artifactory repository')

- [Artifactory package](https://artifacts.apple.com/webapp/#/artifacts/browse/tree/General/nitro-npm-local/@pst/nitro/-/@pst 'Artifactory package')

- [Engweb](https://engweb.apple.com/npm/@pst/nitro 'Engweb Apple')

- [Showcase Link](https://nitro.corp.apple.com/ 'Showcase Link')

- [CI/CD pipelines](https://compute.pie.apple.com/workspaces/nitro/pipelines?repo=nitro-nitro-nitro 'PIE Compute')

- [Box folder](https://apple.ent.box.com/folder/75135164391 'Box')

- Checkout the contributor's guide at [CONTRIBUTING.md](CONTRIBUTING.md)

- Checkout the wiki page at [Wiki.md](wiki.md) (Work in progress)

### Questions ?

[Nitro on Slack](https://a1345092.slack.com/messages/GFBT6A49Y)

[Email Apple Directory Group](mailto:nitro-frontend@group.apple.com 'AD Group')

[Radar Component](rdar://component/1042692 'PST Frontend | 1.0')
