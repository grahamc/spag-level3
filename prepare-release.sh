#!/bin/sh

set -eux


main() {
version=$1

if ! echo "$version" | grep -q "^[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+$"; then
  echo "argv[1] needs to be a version, in x.y.z format."
  exit 1
fi

git status

nix flake update --commit-lock-file

git status

toml set ./Cargo.toml package.version "$version" > Cargo.toml.next
mv Cargo.toml.next Cargo.toml
git add Cargo.toml

git commit -m "Release v$version"
}

main "$@"
