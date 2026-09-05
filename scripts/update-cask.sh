#!/bin/bash
set -euo pipefail

repository="wenLiangcan/Photonic"
cask_path="Casks/photonic.rb"
release_json="$(gh api "repos/$repository/releases/latest")"
tag_name="$(jq -r '.tag_name' <<<"$release_json")"
version="${tag_name#v}"
asset_name="Photonic-$version.dmg"
digest="$(jq -r --arg name "$asset_name" '.assets[] | select(.name == $name) | .digest' <<<"$release_json")"
sha256="${digest#sha256:}"

if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Latest release has an invalid version: $version" >&2
  exit 1
fi

if [[ ! "$sha256" =~ ^[0-9a-f]{64}$ ]]; then
  echo "No valid SHA-256 digest found for $asset_name" >&2
  exit 1
fi

current_version="$(ruby -ne 'puts $1 if $_ =~ /^  version "([^"]+)"/' "$cask_path")"
current_sha256="$(ruby -ne 'puts $1 if $_ =~ /^  sha256 "([^"]+)"/' "$cask_path")"
if [[ "$current_version" == "$version" && "$current_sha256" == "$sha256" ]]; then
  echo "Photonic $version is already current."
  exit 0
fi

CASK_VERSION="$version" CASK_SHA256="$sha256" ruby -pi -e '
  $_ = %(  version "#{ENV.fetch("CASK_VERSION")}"\n) if start_with?(%q(  version "))
  $_ = %(  sha256 "#{ENV.fetch("CASK_SHA256")}"\n) if start_with?(%q(  sha256 "))
' "$cask_path"

brew style "$cask_path"
brew tap wenliangcan/photonic "$PWD"
brew audit --cask --strict wenliangcan/photonic/photonic

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add "$cask_path"
git commit -m "Update Photonic to $version"
git push
