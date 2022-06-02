# Slave to the Boat

## Installation

```bash
# Clone this repo
git clone git@github.com:jaredjensen/slave-to-the-boat.git

# Install dependencies
yarn install
gem install jekyll bundler
bundle install

# Add webrick
bundle add webrick

# Serve locally
yarn serve:jekyll
```

If you get errors when running the commands above, you may need to set env vars according to 
[this StackOverflow answer](https://stackoverflow.com/a/54268289/1104095):

```bash
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
```

I also had to use an older version of ruby: `brew install ruby@2.7`

## Development

```bash
yarn serve:jekyll
```

## Deployment

The site is deployed to Digital Ocean. Commits to `main` will trigger a build and deployment.  The Dockerfile build is not used by DO.

```bash
# Install the CLI
brew install doctl

# Enter access token generated at https://cloud.digitalocean.com/account/api/tokens
doctl auth init

# Update spec
doctl app update ea995903-38fd-4d55-b4f0-0a4e9d7f50dc --spec ./do/app.yaml
```