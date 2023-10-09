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
        uses: coatl-dev/action-pre-commit-autoupdate@v0.2.1
        with:
          config: 'path/to/alternate/pre-commit-config.yaml'
          gh-token: ${{ secrets.GH_TOKEN }}
          skip-hooks: 'pylint'
          skip-repos: 'flake8' # There's no need for the whole URL
```

## Full syntax

### Inputs

- `cache` (`string`): Whether to enable caching. Options: `'yes'`, `'no'`.
  Defaults to `'yes'`. Optional.
- `committer-email` (`string`): Email address used for setting up Git identity.
  Defaults to `'146358438+coatl-bot@users.noreply.github.com'`. Optional.
- `committer-name` (`string`): Name used for setting up Git identity. Defaults
  to `'coatl-bot'`. Optional.
- `config` (`string`): Path to pre-commit config file. Defaults to
  `'.pre-commit-config.yaml'`. Optional.
- `gh-token` (`secret`): GitHub token. Required.
- `pr-base-branch` (`string`): The branch into which you want your code merged.
  Defaults to `'main'`. Optional.
- `pr-branch` (`string`): The branch that contains commits for your pull request.
  Defaults to `'coatl-dev-pre-commit-autoupdate'`. Optional.
- `pr-create` (`string`): Whether to create a Pull Request. Options: `'yes'`,
  `'no'`. Defaults to `'yes'`. Optional.
- `pr-title` (`string`): Title for the pull request. Defaults to
  `'build(deps): coatl-dev pre-commit autoupdate'`. Optional.
- `skip-hooks` (`string`): A comma separated list of hook ids which will be
  disabled. Useful when your `pre-commit-config.yaml` file contains
  [`local hooks`]. Optional. See: [Temporarily disabling hooks].
- `skip-repos`: A list of repos to exclude from autoupdate. The repos must be
  separated by a "pipe" character `'|'`. Defaults to `''`. Optional.

## Outputs

- `update-hit` (`string`): Output is available with a string value that indicates whether a cache hit occurred on the primary key.

[`local hooks`]: https://pre-commit.com/#repository-local-hooks
[Temporarily disabling hooks]: https://pre-commit.com/#temporarily-disabling-hooks
