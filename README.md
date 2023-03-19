# docker-systemd-testinfra-showcase

## Пример

```shell
pipenv shell
pipenv install

docker compose up -d

ansible-playbook --inventory inventory.yml playbook.yml

pytest -v t/testinfra

docker compose down
```
