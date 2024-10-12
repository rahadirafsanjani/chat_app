FROM ruby:3.1.3

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.4.13 && bundle install

COPY . .

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]