FROM jekyll/builder:stable as builder

WORKDIR /build

COPY Gemfile Gemfile.lock package.json yarn.lock ./
COPY _* assets img posts *.html ./

RUN bundle install
RUN yarn install
RUN yarn run build

FROM nginx:alpine as runner

COPY --from=builder /build/public /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]