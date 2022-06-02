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

The site is deployed to Digital Ocean. Commits to `master` will trigger a build using the Dockerfile, which is an nginx image that can run the site standalone. The Digital Ocean build is configured to copy files out of the nginx site folder in the image.