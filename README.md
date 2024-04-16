# homebrew-tap

## How do I install formulae from this tap?

`brew install db-it/tap/<FORMULA>`

Or `brew tap db-it/tap` and then `brew install <FORMULA>`.


# For developers

## How to release a new version of a formula in this tap?

```sh
brew bump-formula-pr -v --write-only --no-audit --url=<RELEASE_ARTIFACT_URL> db-it/tap/<FORMULA>
```

