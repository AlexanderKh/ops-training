FROM ruby:2.3

RUN apt-get install git curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs

WORKDIR /usr/src/app

RUN git clone https://github.com/AlexanderKh/Blog.git .
RUN bundle install

RUN apt-get remove -y git curl python-software-properties
RUN apt-get autoremove -y

EXPOSE 3000

CMD rails server -b 0.0.0.0 -p 3000
