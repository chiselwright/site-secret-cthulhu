FROM chizcw/jekyll-site-base:4105a566 as jekyll-composed

# inherit lots of ONBUILD magic
# if we haven't changed anything upstream our generated site will be output to
# /tmp/jekyll/dest/

#-----
FROM    kyma/docker-nginx

COPY --from=jekyll-composed /tmp/jekyll/dest/ /var/www
RUN     ls -lah /var/www

CMD     'nginx'
