# Slave to the Boat

## Setup

Install `ruby` as described [here](https://jekyllrb.com/docs/installation/macos/). Then install and run this site:

```bash
# Clone this repo
git clone git@github.com:jaredjensen/slave-to-the-boat.git

# Install dependencies
yarn install
gem update --system
gem install eventmachine -- --with-cppflags=-I/usr/local/opt/openssl/include
gem install jekyll bundler
bundle install

# Serve locally
yarn jekyll
```

## Deployment

The site is deployed to Digital Ocean. Commits to `main` will trigger a build and deployment. Deployments should use the app spec defined in the `.do` folder, but the spec can also be manually updated using the DO CLI:

```bash
# Install the CLI
brew install doctl

# Enter access token generated at https://cloud.digitalocean.com/account/api/tokens
doctl auth init

# Update spec
doctl app update ea995903-38fd-4d55-b4f0-0a4e9d7f50dc --spec ./.do/app.yaml
```