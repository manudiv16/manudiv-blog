FROM klakegg/hugo:0.94.1-ext-ubuntu-onbuild as build

ARG ENVIRONMENT

COPY ./ .
RUN if [ "$ENVIRONMENT" = "development" ] ; then hugo --minify --environment development ; else hugo --minify; fi 

#Copy static files to Nginx
FROM nginx:alpine
COPY --from=build /target /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

