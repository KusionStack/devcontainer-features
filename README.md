# Dev Container Features for Kusion
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FKusionStack%2Fdevcontainer-features.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FKusionStack%2Fdevcontainer-features?ref=badge_shield)


This repo now provides kusion feature for devcontainers.


## `kusion` feature

Running `kusion` inside the built container will print the help message of kusion command line.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:bullseye",
    "features": {
        "ghcr.io/KusionStack/devcontainer-features/kusion:0": {}
    }
}
```

```bash
$ kusion
kusion is a cloud-native programmable technology stack, which manages the Kubernetes cluster by code.

Configuration Commands:
  init          Initialize KCL file structure and base codes for a new project
  compile       Compile KCL into YAML
  check         Check if KCL configurations in current directory ok to compile
  ls            List all project and stack information
  deps          Show KCL file dependency information

RuntimeMap Commands:
  preview       Preview a series of resource changes within the stack
  apply         Apply a configuration stack to resource(s) by work directory
  destroy       Destroy a configuration stack to resource(s) by work directory

Other Commands:
  completion    Generate the autocompletion script for the specified shell
  env           Print Kusion environment information
  version       Print the kusion version info

Usage:
  kusion [flags] [options]
```

## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FKusionStack%2Fdevcontainer-features.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FKusionStack%2Fdevcontainer-features?ref=badge_large)