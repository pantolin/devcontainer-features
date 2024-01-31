# A Dev Container Features Collection

## Contents

List of supported features:

- [zsh](https://www.zsh.org), Shell designed for interactive use.
- [eza](https://github.com/eza-community/eza), A modern, maintained replacement for _ls_.
- [bat](https://github.com/sharkdp/bat), A _cat_ clone with syntax highlighting and Git integration.
- [vim](https://www.vim.org), The ubiquitous text editor.


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
    "ghcr.io/pantolin/devcontainer-features/eza:latest": {},
    "ghcr.io/pantolin/devcontainer-features/bat:latest": {},
    "ghcr.io/pantolin/devcontainer-features/vim:latest": {}
  },
}
```