FROM klakegg/hugo:0.104.3-ext-ubuntu-onbuild as build

ARG ENVIRONMENT

COPY ./ .
RUN if [ "$ENVIRONMENT" = "development" ] ; then hugo --minify --environment development ; else hugo --minify; fi 

#Copy static files to Nginx
FROM nginx:1.25.4-alpine
COPY --from=build /target /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

