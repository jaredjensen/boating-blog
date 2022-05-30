FROM jekyll/builder:3.8 as builder

WORKDIR /build

COPY Gemfile Gemfile.lock gulpfile.js package.json yarn.lock ./
COPY src src

RUN bundle install
RUN yarn install
RUN yarn run build

FROM nginx:alpine as runner

COPY --from=builder /build/src/_site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]