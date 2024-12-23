# My Nx Playground

cli commands to generate nx repository

- Generate nx workspace with a nextjs project i.e website

```bash
npx create-nx-workspace@20.0.6 my-nx-playground --workspaceType=integrated --preset=next --appName=website --style=tailwind --nextAppDir=true --nextSrcDir=true --packageManager=npm --skipGit --e2eTestRunner=none
```

- Add two nextjs projects to this workspace blog & promotions

Go to workspace root directory i.e `my-nx-playground`. Below command adds a new project i.e `blog` to apps folder

```bash
#cd my-nx-playground;
# creates application name: blog
npx nx g @nx/next:app apps/blog --src=true --style=tailwind --appDir=true --e2eTestRunner=none --runtimeTsconfigFileName=tsconfig.json
```

Go to workspace root directory i.e `my-nx-playground`. Below command adds a new project i.e `promotions` to apps folder

```bash
npx nx g @nx/next:app apps/promotions --src=true --style=tailwind --appDir=true --e2eTestRunner=none --runtimeTsconfigFileName=tsconfig.json
```

- Add a new js typescript `mylibs` project to be used as utils across multiple projects

```bash
npx nx g @nx/js:lib libs/mylib
```

## Other cli commands to use in the nx workspace

1. List all projects in this workspace `npx nx show projects`
1. To see all available targets to run for a project `npx nx show project <project_name>` i.e `npx nx show project website`
1. To run multiple projects in a workspace `npx nx run-many --target=dev --projects=website,blog --parallel`
1. To run all projects in a workspace `npx nx run-many --target=dev --all --parallel`
1. Run dev command for a project using local nx `npm run nx dev website`
1. Run build command for a project using local nx `npm run nx build website`
1. Docker build image & run container on PORT=4000 i.e `sh apps/website/.scripts/build/local-run.sh` Then the website will be accessible at `http://localhost:4000`
1. Docker stop container & Remove image i.e `sh apps/website/.scripts/build/local-stop.sh`

## Documents referred

1. cli options in creating nx workspace [link](https://nx.dev/nx-api/nx/documents/create-nx-workspace)
1. cli options in generating next.js project in an existing workpace [link](https://nx.dev/nx-api/next)
1. nx plugin registry [link](https://nx.dev/plugin-registry)

## Nx Brandings

<a alt="Nx logo" href="https://nx.dev" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/nrwl/nx/master/images/nx-logo.png" width="45"></a>

✨ Your new, shiny [Nx workspace](https://nx.dev) is ready ✨.

[Learn more about this workspace setup and its capabilities](https://nx.dev/nx-api/next?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) or run `npx nx graph` to visually explore what was created. Now, let's get you up to speed!

## Run tasks

To run the dev server for your app, use:

```sh
npx nx dev website
```

To create a production bundle:

```sh
npx nx build website
```

To see all available targets to run for a project, run:

```sh
npx nx show project website
```

These targets are either [inferred automatically](https://nx.dev/concepts/inferred-tasks?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) or defined in the `project.json` or `package.json` files.

[More about running tasks in the docs &raquo;](https://nx.dev/features/run-tasks?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

## Add new projects

While you could add new projects to your workspace manually, you might want to leverage [Nx plugins](https://nx.dev/concepts/nx-plugins?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) and their [code generation](https://nx.dev/features/generate-code?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) feature.

Use the plugin's generator to create new projects.

To generate a new application, use:

```sh
npx nx g @nx/next:app demo
```

To generate a new library, use:

```sh
npx nx g @nx/react:lib mylib
```

You can use `npx nx list` to get a list of installed plugins. Then, run `npx nx list <plugin-name>` to learn about more specific capabilities of a particular plugin. Alternatively, [install Nx Console](https://nx.dev/getting-started/editor-setup?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) to browse plugins and generators in your IDE.

[Learn more about Nx plugins &raquo;](https://nx.dev/concepts/nx-plugins?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) | [Browse the plugin registry &raquo;](https://nx.dev/plugin-registry?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

## Set up CI!

### Step 1

To connect to Nx Cloud, run the following command:

```sh
npx nx connect
```

Connecting to Nx Cloud ensures a [fast and scalable CI](https://nx.dev/ci/intro/why-nx-cloud?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects) pipeline. It includes features such as:

- [Remote caching](https://nx.dev/ci/features/remote-cache?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
- [Task distribution across multiple machines](https://nx.dev/ci/features/distribute-task-execution?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
- [Automated e2e test splitting](https://nx.dev/ci/features/split-e2e-tasks?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
- [Task flakiness detection and rerunning](https://nx.dev/ci/features/flaky-tasks?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

### Step 2

Use the following command to configure a CI workflow for your workspace:

```sh
npx nx g ci-workflow
```

[Learn more about Nx on CI](https://nx.dev/ci/intro/ci-with-nx#ready-get-started-with-your-provider?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

## Install Nx Console

Nx Console is an editor extension that enriches your developer experience. It lets you run tasks, generate code, and improves code autocompletion in your IDE. It is available for VSCode and IntelliJ.

[Install Nx Console &raquo;](https://nx.dev/getting-started/editor-setup?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

## Useful links

Learn more:

- [Learn more about this workspace setup](https://nx.dev/nx-api/next?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
- [Learn about Nx on CI](https://nx.dev/ci/intro/ci-with-nx?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
- [Releasing Packages with Nx release](https://nx.dev/features/manage-releases?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
- [What are Nx plugins?](https://nx.dev/concepts/nx-plugins?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)

And join the Nx community:

- [Discord](https://go.nx.dev/community)
- [Follow us on X](https://twitter.com/nxdevtools) or [LinkedIn](https://www.linkedin.com/company/nrwl)
- [Our Youtube channel](https://www.youtube.com/@nxdevtools)
- [Our blog](https://nx.dev/blog?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
