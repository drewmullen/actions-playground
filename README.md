# Execute a github workflow manually

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

## Create a PAT

https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

