## New Computer Setup
This is a doc of how I should setup my computer next time. Inspired by Under the Radar #117

Also, see [Casey’s list](https://www.caseyliss.com/2016/7/2/new-mac-who-dis) of his new computer routine.

Next time I setup my computer, I should make sure to follow this list, and update it accordingly.

## Old Computer

 - Disassociate the computer with the iTunes Store
 - Disassociate the computer with the Mac App Store
 - Disassociate the computer with iMessage in Messages.app
 - Turn off Find My Mac
 - Remove the Mac from my support profile
 - If desired, reinstall macOS as per Apple’s instructions

## New Computer

 - Generate private/public [SSH Keys](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add to Github
 - Generate [GPG keys](/setup/GPG.md)
 - Setup Time Machine
 - Setup Mail
 - Setup Messages (originate from phone #)

## Installations

### Everyday
These applications are used for everyday activities.

 - Install 1Password
 - Install Tot
 - Install HEY
 - Install Things
 - Install RescueTime
 - Install iStat Menus (deactivate, and then reactivate)
 - Install Pastebot
 - Install Tweetbot
 - Install Spotify
 - Install Soulver
 - Install Better Blocker
 - Install Tunnelbear
 - Install Slack
 - Install Zoom
 - Install Linear
 - Install Notion
 - Install CleanShot X
 - Install Spark

### Design & Photography
These applications are for design and photography work.

 - Install Adobe CC (Lightroom, Photoshop)
 - Install Figma
 - Install Final Cut Pro (?)
 - Install Timelapse Assembler (?)
 - Install Sip

### Development
These applications or tools are used for development.

 - Install VS Code
 - Install Xcode
 - Install Paw (deactivate, and then reactivate)
 - Install oh-my-zsh
 - Install Homebrew
 - Install rbenv
 - Install Ruby
 - Install rubygems
 - Install fastlane
 - Install Volta
 - Install node
 - Install yarn
 - Install Vercel
 - Install Postgres
 - Install Postico
 - Install MongoDB Compass
 - Install Sim Genie

## File Transfers

 - Copy over ~/.zshrc and ~/.oh-my-zsh
   - *NOTE: You can also install zsh plugins separetely (zsh-autosuggestions and gitstatus)*
 - Xcode certs (using fastlane match)
 - ~/Desktop
 - ~/Documents (not Adobe)
 - ~/Movies
 - ~/Pictures/Lightroom
 - Empty Trash.app

## Design & Development Workflow

- Install `gitstatus`:
```sh
git clone --depth=1 https://github.com/romkatv/gitstatus.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/gitstatus
```
- Install `zsh-autosuggestions`:
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
- Install development fonts ([Fira Code](https://github.com/tonsky/FiraCode))
- Install Xcode theme ([One Dark](https://github.com/bojan/xcode-one-dark))
- Install [One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme) for VS Code.
- Install Solarized Dark from this folder
- Look at other files in this folder and copy over as necessary.

Setup these Git Defaults:
```sh
git config --global pull.rebase true
git config --global fetch.prune true
git config --global diff.colorMoved zebra
```
