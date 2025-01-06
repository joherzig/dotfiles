# README

## Overview

This repository contains two Git configuration files: `.gitconfig` and `.work.gitconfig`. These configuration files are used to manage different Git settings for personal and work environments.

## .gitconfig

The `.gitconfig` file is the main Git configuration file that includes general settings and aliases for Git commands. It also includes conditional configuration based on the directory.

### Sections

- **[user]**: Defines the user information for personal use.

  - `name`: John Doe Personal
  - `email`: john.doe@personal.com

- **[includeIf "gitdir:~/work/"]**: Includes the `.work.gitconfig` file if the Git directory is within the `~/work/` path.

- **[merge]**: Configures merge behavior.

  - `ff`: Fast-forward merges are disabled.

- **[fetch]**: Configures fetch behavior.

  - `prune`: Prune remote-tracking branches that no longer exist on the remote.
  - `pruneTags`: Prune tags that no longer exist on the remote.

- **[pull]**: Configures pull behavior.

  - `rebase`: Rebase branches when pulling.

- **[alias]**: Defines custom Git command aliases.

  - `cleanup`: Deletes branches that have been removed from the remote.
  - `pushu`: Pushes the current branch to the remote without verification and sets upstream.
  - `pullall`: Pulls updates for all repositories in the current directory.
  - `checkoutall`: Checks out a specified branch for all repositories in the current directory.

- **[difftool]**: Configures the diff tool.

  - `prompt`: Prompts before launching the diff tool.

- **[diff]**: Specifies the diff tool to use.

  - `tool`: Uses `nvimdiff` as the diff tool.

- **[difftool "nvimdiff"]**: Configures the `nvimdiff` tool.
  - `cmd`: Command to launch `nvimdiff` with the local and remote files.

## .work.gitconfig

The `.work.gitconfig` file is included conditionally when working within the `~/work/` directory. It contains work-specific Git settings.

### Sections

- **[user]**: Defines the user information for work use.

  - `name`: John Doe Work
  - `email`: john.doe@work.com

- **[core]**: Configures core Git settings.
  - `sshCommand`: Specifies the SSH command to use with a specific SSH key for work.
