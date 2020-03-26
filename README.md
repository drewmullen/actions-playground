# Execute a github workflow manually

Below are several examples for how to kick off workflow jobs manually via curl (or any external event)

## Create workflow at .github/workflows/file.yml

Notice the `event_type` [matches](https://github.com/drewmullen/actions-playground/blob/fd3721ba3c8350995a77c570fbf3a0e0fb1c2724/.github/workflows/external_echo.yml#L5) the workflow field: `on.repository_dispatch.types`. the workflow file name does not need to match.

## To Execute

```bash
$ curl -XPOST -u "drewmullen" \
  -H "Accept: application/vnd.github.everest-preview+json" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/drewmullen/actions-playground/dispatches \
  --data '{"event_type": "external-echo"}'

Enter host password for user 'drewmullen': <YOUR PAT>
```

## Specify a branch

`repository_dispatch` always uses master branch. To use another branch, view [this workflow](https://github.com/drewmullen/actions-playground/blob/master/.github/workflows/repo_dispatch.yml) and set `client_payload.ref`:

```bash
curl -XPOST -u "drewmullen" \
  -H "Accept: application/vnd.github.everest-preview+json" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/drewmullen/actions-playground/dispatches \
  --data '{"event_type": "my-dispatch", "client_payload": {"ref": "test-pr4"}}'
  ```

[Example CI Output](https://github.com/drewmullen/actions-playground/runs/536425490?check_suite_focus=true)

## Condition steps to run based on input

If you'd like the same event to kick of specific jobs, use the `if` [condition](https://github.com/drewmullen/actions-playground/blob/master/.github/workflows/multi_repo_dispatch.yml).

```bash
curl -XPOST -u "drewmullen" \
  -H "Accept: application/vnd.github.everest-preview+json" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/drewmullen/actions-playground/dispatches \
  --data '{"event_type": "multi-dispatch", "client_payload": {"ref": "test-pr6", "project": "dir1"}}'
```

[Example CI Output](https://github.com/drewmullen/actions-playground/runs/536598658?check_suite_focus=true)


## Multiple dirs, same step

[multi_single_step.yml](https://github.com/drewmullen/actions-playground/blob/master/.github/workflows/multi_single_step.yml)

[Example CI Output](https://github.com/drewmullen/actions-playground/runs/536824189?check_suite_focus=true)


## Run from a container

[container.yml](https://github.com/drewmullen/actions-playground/blob/master/.github/workflows/container.yml)

[Example CI Output](https://github.com/drewmullen/actions-playground/runs/536598658?check_suite_focus=true)


## Create a PAT

https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

