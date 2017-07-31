# Liferay Elasticsearch Image
This repository contains a dockerfile to build authomatic image with  2.2.2 Elasticsearch version with Liferay necesaries plugins installed. This image expose 9200 and 9300 ports to access and has a volume in /usr/share/elasticsearch

You could access to head plugin with this url:
http://localhost:9200/_plugin/head (if you set "-p 9200:9200" parameter).

Configuration file (elasticsearch.yml) is in volume path.

## How to use this image
To run a new container with this image you only need to execute:

`docker run -d --rm -p 9200:9200 -p 9300:9300 --name elasticliferay ironcero/elasticsearchliferay`

If you want a persisten volume on container you'll need to execute:

`docker run -d --rm -p 9200:9200 -p 9300:9300 -v PATH:/usr/share/elasticsearch --name elasticliferay ironcero/elasticsearchliferay`

## Changing Liferay Configuration
If you want to use this container for Liferay DXP you will need to change basic configuration. This Elasticsearch only work with Liferay when you uncheck "Client transport sniff" option on Liferay Elasticsearch configuration.
