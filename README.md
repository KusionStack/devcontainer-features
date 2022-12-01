# Dev Container Features for Kusion

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
kusion is a cloud-native programmable technology stack, which manages the
Kubernetes cluster by code.
[2022-11-29T07:01:34.032Z] 

Configuration Commands:
  init        Initialize KCL file structure and base codes for a new project
  compile     Compile KCL into YAML
  check       检查当前目录中的 KCL 配置是否可以编译
  ls          List all project and stack information
  deps        Show KCL file dependency information

Runtime Commands:
  preview     Preview a series of resource changes within the stack
  apply       Apply a configuration stack to resource(s) by work directory
  destroy     Destroy a configuration stack to resource(s) by work directory

Other Commands:
  env         Print Kusion environment information
  version     Print the kusion version info

Usage:
  kusion [flags] [options]

Use "kusion <command> --help" for more information about a given command.
```