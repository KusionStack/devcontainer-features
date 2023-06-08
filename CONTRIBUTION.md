## Update the Feature

The main logic of the kusion feature is in following files:
- src/kusion/devcontainer-feature.json: the metadata of the feature, for example the id, version, parameters, env, dependent extensions...
- src/kusion/install.sh: the install script to install kusion and kclvm to the container.

### Update the Sources
We could update these two files to upgrade kusion versions, parameters, etc.

### Update The Tests
And after updated the feature, remember to update the tests in `test/_global` and `test/kusion`

### Push and Trigger CI
Pushing the updates to the repository will trigger a [CI pipeline](https://github.com/KusionStack/devcontainer-features/actions/workflows/test.yaml), please make sure to paas the tests.

## Release the Feature

### Trigger Release Action

To release the feature to the latest version, manually trigger the 'Release dev container features & Generate Documentation' task in the [Github Workflows](https://github.com/KusionStack/devcontainer-features/actions/workflows/release.yaml).

### Make Sure the Package Is Released

After the release pipeline succeeded, the version of the feature packages should be updated to the released version. Check (here)[https://github.com/KusionStack/devcontainer-features/pkgs/container/devcontainer-features%2Fkusion] to make sure the kusion feature package version is updated.

### Trigger the PreBuild If Needed

Then after releasement, We can manually trigger a prebuild task in the repository which adopted the feature in its [codespaces settings page](https://github.com/${user}/${repo}/settings/codespaces).