# Homebrew tap for Photonic

This tap installs [Photonic](https://github.com/wenLiangcan/Photonic), a lightweight native image viewer for Apple silicon Macs running macOS 14 or later.

## Install

```bash
brew tap wenliangcan/photonic
brew install --cask photonic
```

Photonic is currently distributed without Apple notarization. If macOS prevents it from opening, run:

```bash
xattr -dr com.apple.quarantine /Applications/Photonic.app
```

## Update

```bash
brew update
brew upgrade --cask photonic
```

The Cask is automatically checked against the latest Photonic GitHub release every six hours.
