FROM elasticsearch:2.2.2
MAINTAINER Ignacio Roncero Bazarra <ironcero@gmail.com>

# Install plugins:
RUN wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/plugin/analysis-icu/2.2.2/analysis-icu-2.2.2.zip
RUN /usr/share/elasticsearch/bin/plugin install file:analysis-icu-2.2.2.zip

RUN wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/plugin/analysis-kuromoji/2.2.2/analysis-kuromoji-2.2.2.zip
RUN /usr/share/elasticsearch/bin/plugin install file:analysis-kuromoji-2.2.2.zip

RUN wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/plugin/analysis-smartcn/2.2.2/analysis-smartcn-2.2.2.zip
RUN /usr/share/elasticsearch/bin/plugin install file:analysis-smartcn-2.2.2.zip

RUN wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/plugin/analysis-stempel/2.2.2/analysis-stempel-2.2.2.zip
RUN /usr/share/elasticsearch/bin/plugin install file:analysis-stempel-2.2.2.zip

RUN wget https://github.com/mobz/elasticsearch-head/archive/master.zip
RUN /usr/share/elasticsearch/bin/plugin install file:master.zip

ADD elasticsearch.yml /usr/share/elasticsearch/config/.
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch

VOLUME ['/usr/share/elasticsearch/data', '/usr/share/elasticsearch/config']
