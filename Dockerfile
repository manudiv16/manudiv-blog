FROM nginx:alpine as build

RUN apk add --update \
	wget \
	git

ARG ENVIRONMENT
ARG HUGO_VERSION="0.78.0"
RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
	tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
	rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
	mv hugo /usr/bin

COPY ./ /site
WORKDIR /site
RUN if [ "$ENVIRONMENT" = "development" ] ; then hugo --environment development ; else hugo ; fi

#Copy static files to Nginx
FROM nginx:alpine
COPY --from=build /site/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

