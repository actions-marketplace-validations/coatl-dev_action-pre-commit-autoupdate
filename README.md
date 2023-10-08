# action-pre-commit-autoupdate

GitHub action for running `pre-commit autoupdate` and allow to skip hooks.

## Usage

To use this action, add the following step to your workflow file (e.g.
`.github/workflows/schedule.yaml`).

```yml
name: scheduled

on:
  schedule:
    # Monday at 00:00 UTC
    - cron: '0 0 * * 1'

jobs:
  pre-commit-autoupdate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Update pre-commit hooks
        uses: coatl-dev/action-pre-commit-autoupdate@v0.0.0
        with:
          gh-token: ${{ secrets.GH_TOKEN }}
          skip-repos: 'flake8' # There's no need for the whole URL
```

## Full syntax

The full syntax for this action is:

```yml
  uses: coatl-dev/action-pre-commit-autoupdate@v0.0.0 # or v0
  with:
    committer-email: 'johndoe@example.com' # string. Email address used for setting up Git identity. Defaults to '146358438+coatl-bot@users.noreply.github.com'. Optional.
    committer-name: 'John Doe' # string. Name used for setting up Git identity. Defaults to 'coatl-bot'. Optional.
    config: 'path/to/config' # string. Path to pre-commit config file. Defaults to '.pre-commit-config.yaml'. Optional.
    gh-token: ${{ secrets.GH_TOKEN }} # secret. GitHub token. Required.
    pr-base-branch: 'main' # string. The branch into which you want your code merged. Defaults to 'main'. Optional.
    pr-branch: 'coatl-dev-pre-commit-autoupdate' # string. The branch that contains commits for your pull request. Defaults to 'coatl-dev-pre-commit-autoupdate'. Optional.
    pr-title: 'build(deps): coatl-dev pre-commit autoupdate' # string. Title for the pull request. Defaults to 'build(deps): coatl-dev pre-commit autoupdate'. Optional.
    skip-repos: 'repo1|repo2|repo3' # string. A list of repos to exclude from autoupdate. The repos must be separated by a "pipe" character '|'. Defaults to ''. Optional.
```

## Outputs

### `update-hit`

**update-hit** output is available with a string value that indicates whether a cache hit occurred on the primary key:
