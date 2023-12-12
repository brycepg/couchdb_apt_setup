# Notice

This codebase uses ansible to automate the installation of couchdb
as a single database. Please note that this configuration opens up
the database for remote connections with the password. If the database
is open to the web, https is required to prevent mitm attacks on login.

# Getting started

## Prerequisites

These files support Debian based remotes

Install ansible (ubuntu or WSL)

    sudo apt install ansible

Install SSH, start sshd on your remote, and add your ssh pubkey to the remote

## Configuration

### inventory.yml

Set your inventory:

Change the ip in ``inventory.yml`` to another IP or your web server url

For example

```yaml
couchdb:
  hosts:
    example.com:
```

Where example.com is the remote with ssh access that you want to install couchdb

### Set vault password

    rm vault.yml
    ansible-vault create vault.yml

Se the contents of ``vault.yml`` to the password you want for couchdb:

```yaml
    couchdb_password: yourstrongcouchdbpassword
```

And then encrypt it with another password that you store in your password manager

## Run
