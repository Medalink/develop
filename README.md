Run our development setup script:

```bash
./setup.sh
```

Add env variables to your environment:

GNU Bash:
```bash
export $(grep -v '^#' .env.node | xargs -0)
```

Bash:
```bash
export $(grep -v '^#' .env.node | xargs -d '\n')
```

Fish:
```bash
set NODE_AUTH_TOKEN {INSERT_KEY}
set FONTAWESOME_TOKEN {INSERT_KEY}
```
Switch to your directory and link valet:

```bash
valet link; valet secure
```

Open up DBngin and add a Redis connection and a MySQL connection with default ports
and start both services.

Update your .env (or create one) file with local values:

```dotenv
DB_HOST=127.0.0.1
DB_DATABASE=archy
DB_USERNAME=root
DB_PASSWORD=

REDIS_HOST=127.0.0.1
REDIS_PORT=6379
```

Run migrations:

```bash
php artisan migrate:fresh --seed
```

Build FE:

```bash
yarn; yarn dev
```

Visit https://archy.test

Use developer login for now since we do not have Google auth setup for this new domain. 
You can change the ID to match your typical user ID.

https://archy.test/developer/login/13


Brew permission directory fix:
```bash
sudo chown -R $(whoami) /usr/local/Homebrew
sudo chown -R $(whoami) /usr/local/var/homebrew
sudo chown -R $(whoami) /usr/local/etc/bash_completion.d /usr/local/lib/pkgconfig /usr/local/share/aclocal /usr/local/share/doc /usr/local/share/info /usr/local/share/locale /usr/local/share/man /usr/local/share/man/man1 /usr/local/share/man/man3 /usr/local/share/man/man5 /usr/local/share/man/man7 /usr/local/share/man/man8 /usr/local/share/zsh /usr/local/share/zsh/site-functions /usr/local/var/log /usr/local/Cellar /usr/local/lib
```
