# GPG Keys

This is a doc on how to sign commits with GPG. Look at the following links:

1. https://help.github.com/articles/signing-commits-with-gpg/
2. https://stackoverflow.com/a/47087248/1740273
3. https://stackoverflow.com/a/44303808/1740273 (`killall gpg-agent` and then `gpg-agent --daemon`)

## 1. Install GPG CLI
First you have to install the necessary things with homebrew.
```
brew install gnupg gnupg2 pinentry-mac
```

## 2. Generate a new GPG Key
Once you have the CLI installed, you can [generate your new GPG Key](https://help.github.com/articles/generating-a-new-gpg-key/#generating-a-gpg-key).
```
gpg --full-generate-key
```

- At the prompt, specify the kind of key you want, or press `Enter` to accept the default `RSA and RSA`.
- Enter the desired key size. We recommend the maximum key size of `4096`.
- Enter the length of time the key should be valid. Press `Enter` to specify the default selection, indicating that the key doesn't expire.
- Verify that your selections are correct.
- Enter your user ID information.
- Type a secure passphrase.

You can then find the key ID be executing the following command:
```
gpg --list-secret-keys --keyid-format LONG
```
The key ID is right after `sec rsa4096/KEYID_IS_HERE`.

## 3. Add Key to GitHub account
You can export your key like this:
```
gpg --armor --export KEYID_IS_HERE
```

Once you copy the output, you can [add it to your GitHub account](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/).

## 4. Setup Git to Use GPG Key
Now you have to tell Git about your GPG key:
```
git config --global user.signingkey KEYID_IS_HERE
git config --global commit.gpgsign true
git config --global gpg.program gpg
```

Then you can edit `nano ~/.gnupg/gpg.conf` to add the following:
```
no-tty
```

And edit `nano ~/.gnupg/gpg-agent.conf` to add this:
```
pinentry-program /usr/local/bin/pinentry-mac
```

## 5. Signing Git Commits
Now, whenever you commit some code, simply tack on the `-S` flag like so:
```
git commit -S -m "this commit is now signed!"
```

## Troubleshooting
If Git is failing to sign commits, try restarting the `gpg-agent`:
```
killall gpg-agent
gpg-agent --daemon
```
