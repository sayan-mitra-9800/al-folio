FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Amir Pourmand"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    locales \
    imagemagick \
    ruby-full \
    build-essential \
    zlib1g-dev \
    jupyter-nbconvert \
    inotify-tools procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JEKYLL_ENV=production

RUN gem install jekyll bundler

RUN mkdir -p /srv/jekyll

WORKDIR /srv/jekyll

COPY Gemfile /srv/jekyll/

# Install gems into vendor/bundle so they survive when we mount the project over /srv/jekyll
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install --no-cache

EXPOSE 8080

COPY bin/entry_point.sh /tmp/entry_point.sh
RUN chmod +x /tmp/entry_point.sh

CMD ["/tmp/entry_point.sh"]
