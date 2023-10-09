# action-pre-commit-autoupdate

GitHub action for running `pre-commit autoupdate` and allow to skip hooks.

## Usage

To use this action, add the following step to your workflow file (e.g.
`.github/workflows/schedule.yaml`).

```yml
name: pre-commit-autoupdate

on:
  schedule:
    # Monday at 10:00 PST
    - cron: '0 18 * * 1'

jobs:
  pre-commit-autoupdate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Update pre-commit hooks
        uses: coatl-dev/action-pre-commit-autoupdate@v0.2.0
        with:
          gh-token: ${{ secrets.GH_TOKEN }}
          pre-commit-skip-hooks: 'pylint'
          skip-repos: 'flake8' # There's no need for the whole URL
```

## Full syntax

The full syntax for this action is:

```yml
  uses: coatl-dev/action-pre-commit-autoupdate@v0.2.0 # or v0
  with:
    cache: 'yes' # string. Whether to enable caching. Options: 'yes', 'no'. Optional.
    committer-email: 'johndoe@example.com' # string. Email address used for setting up Git identity. Defaults to '146358438+coatl-bot@users.noreply.github.com'. Optional.
    committer-name: 'John Doe' # string. Name used for setting up Git identity. Defaults to 'coatl-bot'. Optional.
    config: 'path/to/config' # string. Path to pre-commit config file. Defaults to '.pre-commit-config.yaml'. Optional.
    gh-token: ${{ secrets.GH_TOKEN }} # secret. GitHub token. Required.
    pr-base-branch: 'main' # string. The branch into which you want your code merged. Defaults to 'main'. Optional.
    pr-branch: 'coatl-dev-pre-commit-autoupdate' # string. The branch that contains commits for your pull request. Defaults to 'coatl-dev-pre-commit-autoupdate'. Optional.
    pr-create: 'yes' # string. Whether to create a Pull Request. Options: 'yes', 'no'. Optional.
    pr-title: 'build(deps): coatl-dev pre-commit autoupdate' # string. Title for the pull request. Defaults to 'build(deps): coatl-dev pre-commit autoupdate'. Optional.
    pre-commit-skip-hooks: '' # string. A comma separated list of hook ids which will be disabled.
    skip-repos: 'repo1|repo2|repo3' # string. A list of repos to exclude from autoupdate. The repos must be separated by a "pipe" character '|'. Defaults to ''. Optional.
```

## Outputs

### `update-hit`

**update-hit** output is available with a string value that indicates whether a cache hit occurred on the primary key:
