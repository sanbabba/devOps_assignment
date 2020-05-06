`openssl rand -base64 512 |xargs > vaultkeyfile`
`ansible-vault create php_counter_app_start.yml --vault-password-file=vaultkeyfile`

