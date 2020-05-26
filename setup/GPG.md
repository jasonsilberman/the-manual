# GPG Keys

This is a doc on how to sign commits with GPG. Look at the following links:

1. https://help.github.com/articles/signing-commits-with-gpg/
2. https://stackoverflow.com/a/47087248/1740273
3. https://stackoverflow.com/a/44303808/1740273 (`killall gpg-agent` and then `gpg-agent --daemon`)

## 1. Install GPG CLI
First you have to install the necessary things with homebrew.
```sh
brew install gnupg gnupg2 pinentry-mac
```

## 2. Generate a new GPG Key
Once you have the CLI installed, you can [generate your new GPG Key](https://help.github.com/articles/generating-a-new-gpg-key/#generating-a-gpg-key).
```sh
gpg --full-generate-key
```

- At the prompt, specify the kind of key you want, or press `Enter` to accept the default `RSA and RSA`.
- Enter the desired key size. We recommend the maximum key size of `4096`.
- Enter the length of time the key should be valid. Press `Enter` to specify the default selection, indicating that the key doesn't expire.
- Verify that your selections are correct.
- Enter your user ID information.
- Type a secure passphrase.

You can then find the key ID be executing the following command:
```sh
gpg --list-secret-keys --keyid-format LONG
```
The key ID is right after `sec rsa4096/KEYID_IS_HERE`.

## Or Transfer a Previous Key
If you have already created a GPG key and want to transfer it to a new machine, [we can also do that](https://www.phildev.net/pgp/gpg_moving_keys.html).

First you must export the previous keys on the old machine:
```sh
gpg --export-secret-keys -a keyid > my_private_key.asc
gpg --export -a keyid > my_public_key.asc
```

After the keys have been exported you can transfer them to the new machine using [`scp`](https://research.csc.fi/csc-guide-copying-files-from-linux-and-mac-osx-machines-with-scp):
```sh
scp my_private_key.asc username@IP_ADDRESS:
scp my_public_key.asc username@IP_ADDRESS:
```
*NOTE1: The new machine must have `ssh` enabled.*
*NOTE2: By default the new files will be in user's home directory.*

Once the keys have been transferred to the new machine, we have to import them:
```sh
gpg --import my_private_key.asc
gpg --import my_public_key.asc
```

Finally, we have to trust the keys on the new machine:
```sh
gpg --edit-key EMAIL_ADDRESS
```

You can export your key like this:
```sh
gpg --armor --export KEY_ID_HERE
```

And then type the `trust` command and follow the prompts.

*NOTE: For your own keys `5 (Ultimate)` is okay, but otherwise do not ultimately trust anybody else's keys.*

Once this is done, make sure to properly dispoe of the exported keys on both machines.

## 3. Add Key to GitHub account
Once you copy the output, you can [add it to your GitHub account](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/).

You can export the key with the following command:
```sh
gpg --armor --export KEY_ID_HERE
```

## 4. Setup Git to Use GPG Key
Now you have to tell Git about your GPG key:
```sh
git config --global user.signingkey KEYID_IS_HERE
git config --global commit.gpgsign true
git config --global gpg.program gpg
```

*NOTE: Git's config for `user.email` must match the GPG key. To change the email do this: `git config --global user.email EMAIL_ADDRESS`.*

And edit `nano ~/.gnupg/gpg-agent.conf` to add this:
```sh
pinentry-program /usr/local/bin/pinentry-mac
```

## 5. Signing Git Commits
Now, whenever you commit some code, simply tack on the `-S` flag like so:
```sh
git commit -S -m "this commit is now signed!"
```

*NOTE: The first time you commit with the new key you will be asked for the key's passphrase.*

## Troubleshooting
If Git is failing to sign commits, try restarting the `gpg-agent`:
```sh
killall gpg-agent
gpg-agent --daemon
```
