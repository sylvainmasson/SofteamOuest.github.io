FROM jekyll/builder

RUN apk update 

RUN apk add nginx 

ADD . . 

RUN chmod ugo+w ./Gemfile.lock

RUN rm -rf /usr/share/nginx/html

RUN jekyll build 

RUN ls -la /srv/jekyll

RUN mkdir -p /usr/share/nginx/html

RUN cp -r /srv/jekyll/_site /usr/share/nginx/html

RUN mkdir /run/nginx 

COPY default.conf /etc/nginx/conf.d

EXPOSE 80 

CMD nginx -g "daemon off;"