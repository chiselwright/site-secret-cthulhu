FROM jekyll/jekyll:latest as jekyll

WORKDIR /srv/jekyll/

COPY    Gemfile*     /srv/jekyll/
RUN     bundle install

COPY    .            /srv/jekyll/

RUN     jekyll build --destination /tmp/site
RUN     ls -larth /tmp/site

#-----
FROM    kyma/docker-nginx

COPY --from=jekyll /tmp/site/ /var/www
RUN     ls -l /var/www

CMD     'nginx'
