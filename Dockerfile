FROM ruby:alpine
MAINTAINER Erwan Palanque <erwan.benard@gmail.com>

# Install ruby rails and dependencies
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base"
ENV DEV_PACKAGES="git zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev cmake"
ENV RUBY_PACKAGES="ruby ruby-io-console ruby-json yaml nodejs"
RUN apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES
RUN gem install -N bundler
RUN gem install -N nokogiri -- --use-system-libraries
RUN gem install -N rails
RUN echo 'gem: --no-document' >> ~/.gemrc
RUN cp ~/.gemrc /etc/gemrc
RUN chmod uog+r /etc/gemrc

# Cleanup and settings
RUN bundle config --global build.nokogiri  "--use-system-libraries"
RUN bundle config --global build.nokogumbo "--use-system-libraries"
RUN find / -type f -iname \*.apk-new -delete
RUN rm -rf /var/cache/apk/*
RUN rm -rf /usr/lib/lib/ruby/gems/*/cache/*
RUN rm -rf ~/.gem

# Install Canaryboard
RUN rm -rf /opt/canaryboard && git clone https://github.com/Goggot/canaryboard.git /opt/canaryboard
RUN cd /opt/canaryboard && sh build.sh

# Define container
WORKDIR /opt/canaryboard
EXPOSE 3000
ENTRYPOINT ["rails", "s"]
