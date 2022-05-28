FROM klakegg/hugo:0.89.2-ext-ubuntu-onbuild as build

ARG ENVIRONMENT

COPY ./ .
RUN if [ "$ENVIRONMENT" = "development" ] ; then hugo --minify --environment development ; else hugo --minify; fi 

#Copy static files to Nginx
FROM nginx:1.22.0-alpine
COPY --from=build /target /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

