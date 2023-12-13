This codebase automates the installation of couchdb for obsididan-livesync with ansible

# Notice

This codebase uses ansible to automate the installation of couchdb
as a standalone database. Please note that this configuration opens up
the database for remote connections with the password. If the database
is open to the web, https is required in order to prevent mitm attacks on login.

# Getting started

## Prerequisites

These files support Debian based remotes

### Local requirements

Install ansible

    pip install ansible

Ensure ssh is installed locally

### Remote requirements

Install sshd, ensure sshd is started your remote, and add your ssh pubkey to the remote user's ``~/.ssh/authorized_keys``

## Configuration

### inventory.yml

Set your inventory:

Change the ip in ``inventory.yml`` to another IP or your web server url

For example if your host was ``example.com`` your ``inventory.yml`` would look like this:

```yaml
couchdb:
  hosts:
    example.com:
```

Where ``example.com`` is the remote with ssh access that you want to install couchdb. the host can also be an IP (see the provided ``inventory.yml`` for an example)

### Set password

You can set the password with or without vault. Using vault is a secure way of storing the couchdb password

#### Set password without vault

overwrite ``vault.yml`` file:

    rm vault.yml
    vim vault.yml

and set it to

```yml
couchdb_password: yourthrowawaypassword
```

You can encrypt the vault later with:

    ansible-vault encrypt vault.yml

#### Set password with vault

Using vault provides a way of using the same password for provisioning without leaving it on your filesystem in plaintext.


    rm vault.yml
    ansible-vault create vault.yml

Set the vault password with one that you store in your password manager.

Set the contents of ``vault.yml`` to the password you want for couchdb:

```yaml
couchdb_password: yourstrongcouchdbpassword
```


## Run

If ``inventory.yml`` and the couchdb password is set, this configures couchdb in its entirety.  
After this playbook runs, you should be able to connect obisdian livesync at ``http://<your ip or domain>:5984``

Use the password you set inside ``vault.yml`` for obsidian-livesync

### Run with vault

    ansible-playbook --ask-vault-pass -i inventory.yml main.yml

Enter your vault password.

### Run without vault

    ansible-playbook -i inventory.yml main.yml

