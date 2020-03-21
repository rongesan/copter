FROM ruby:2.6.5
ENV LANG C.UTF-8

RUN apt-get update -qq \
  && apt-get install -y \
     build-essential \
     nodejs \
  && rm -rf /var/lib/apt/lists/*
RUN gem install bundler

ENV APP_HOME /my_app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install

ADD . $APP_HOME

