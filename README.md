# Slave to the Boat

## Setup

Install [ruby](https://jekyllrb.com/docs/installation/macos/) and [rbenv](https://rbenv.org/), then:

```sh
ruby_ver=3.3.6 # or whatever is in Gemfile
rbenv install $ruby_ver
rbenv local $ruby_ver

# Clone this repo
git clone git@github.com:jaredjensen/slave-to-the-boat.git

# Install dependencies
yarn install
gem update --system
gem install eventmachine -- --with-cppflags=-I/usr/local/opt/openssl/include
gem install jekyll bundler
bundle install

# Serve locally
yarn serve
```

## Adding Posts

1. Create a file, e.g. `/_posts/2023-04-15-boats-are-fun.html`
2. Add front matter:

   ```yaml
   ---
   layout: post
   title: "Boats are fun"
   subtitle: "You should get one!"
   date: 2023-04-15
   background: '/img/posts/bg-boats-are-fun.jpg'
   preview: '/img/posts/boats-are-fun-preview.jpg'
   ---
   ```

3. Create the 1900 × 1069 header image and store at `/img/posts/bg-boats-are-fun.jpg`
4. Create any post body images as 730px wide and store at `/img/posts/boats-are-fun-something.jpg`

## Deployment

The site is deployed to Digital Ocean. Commits to `main` will trigger a build and deployment. Deployments should use the app spec defined in the `.do` folder, but the spec can also be manually updated using the DO CLI:

```sh
# Install the CLI
brew install doctl

# Enter access token generated at https://cloud.digitalocean.com/account/api/tokens
doctl auth init

# Update spec
doctl app update ea995903-38fd-4d55-b4f0-0a4e9d7f50dc --spec ./.do/app.yaml
```
