# Logstash Plugin

This is a plugin for [Logstash](https://github.com/elasticsearch/logstash).

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

## Documentation

This plugin get logs from an algolia app (https://www.algolia.com/doc/rest_api#SectionLogs).

Main idea is to retrieve logs from algolia and put it in elasticsearch (or elsewhere) after some filters.
With Kibana or curiosity (https://github.com/pagesjaunes/curiosity).

See an example of [conf](https://github.com/ErwanPigneul/logstash-input-algolialogs/blob/master/logstash-input-algolialogs.conf) 