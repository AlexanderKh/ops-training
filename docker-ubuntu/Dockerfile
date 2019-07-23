FROM ruby:2.3

RUN apt-get install git

WORKDIR /usr/src/app

RUN git clone https://github.com/AlexanderKh/Blog.git .
RUN bundle install

CMD rails server
