# A Dev Container Features Collection

## Contents

List of supported features:

- [eza](https://github.com/eza-community/eza), A modern, maintained replacement for _ls_.
- [zsh](https://www.zsh.org), Shell designed for interactive use.


Example of use:

  "features": {
    "ghcr.io/devcontainers/features/java:1": {},
    "ghcr.io/devcontainers/features/docker-in-docker:2": {},
    "ghcr.io/devcontainers/features/common-utils:1": {},
    "ghcr.io/mikaello/devcontainer-features/kotlinc:latest": {},
    "ghcr.io/mikaello/devcontainer-features/modern-shell-utils:latest": {}
  },

  ## Usage

To reference a Feature from this repository, add the desired Features to a `devcontainer.json`. Each Feature has a `README.md` that shows how to reference the Feature and which options are available for that Feature.

The example below installs the `eza` and `zsh` declared in the [`./src`](./src) directory of this
repository.

See the relevant Feature's README for supported options.

```jsonc
"name": "my-project-devcontainer",
"image": "mcr.microsoft.com/devcontainers/base:ubuntu",  // Any generic, debian-based image.
"features": {
    "ghcr.io/pantolin/devcontainer-features/zsh:latest": {},
    "ghcr.io/pantolin/devcontainer-features/eza:latest": {}
  },
}
```