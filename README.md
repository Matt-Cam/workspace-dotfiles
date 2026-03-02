# matt-cameron-dotfiles

Personal dotfiles for Matt Cameron's Datadog Workspaces.

## What this is

This repo is applied automatically when a new workspace is created. It sets up the git identity and workspace-specific git configuration so commits work correctly out of the box.

It was set up following [Personalizing Your Workspace](https://datadoghq.atlassian.net/wiki/spaces/DEVX/pages/3068528729/Personalizing+Your+Workspace) and created from the [DataDog/workspaces-dotfiles-template](https://github.com/DataDog/workspaces-dotfiles-template).

## What's included

- `.gitconfig` — git identity (name, email), GitHub SSH URL rewrite, global hooks path for the workspace

## What's not included

- Claude config (`~/.claude`) — too dynamic to version here. Sync manually when needed:
  ```sh
  rsync -av ~/.claude/ workspace-<name>:~/.claude/ --exclude='.credentials.json' --exclude='projects/'
  ```

## Usage

Registered in `~/.config/datadog/workspaces/config.yaml` as `dotfiles: git@github.com:DataDog/matt-cameron-dotfiles` — applied automatically on every `workspaces create`.
