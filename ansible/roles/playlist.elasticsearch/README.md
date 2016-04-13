# Ansible Elasticsearch Role

[![Circle CI](https://circleci.com/gh/playlist-ansible/elasticsearch.svg?style=shield)](https://circleci.com/gh/playlist-ansible/elasticsearch)
[![Galaxy](https://img.shields.io/badge/galaxy-playlist.elasticsearch-blue.svg)](https://galaxy.ansible.com/list#/roles/3242)

Installs and configures Elasticsearch.

## Requirements and Dependencies

Depends on a JRE (`playlist.java`).

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install playlist.elasticsearch
```

## Role Variables

```yaml
elasticsearch_version: 1.5
elasticsearch_state: present

# ---- Plugins ----

# Examples:
#
# It follows the same syntax as using the ES plugin manager:
# bin/plugin -i <name> -u <url>
#
# The url and config is optional.
#
#
# Using only a name...
#
#elasticsearch_plugins:
#  - name: 'com.sksamuel.elasticsearch/elasticsearch-river-redis/1.1.0'
#
#elasticsearch_plugins:
#  - name: 'com.sksamuel.elasticsearch/elasticsearch-river-redis/1.1.0'
#    delete: True
#
#
# Using a name with url...
#
#elasticsearch_plugins:
#  - name: 'facet-script'
#    url: 'http://dl.bintray.com/content/imotov/elasticsearch-plugins/elasticsearch-facet-script-1.1.2.zip'
#
#
# Using a name and custom configuration (in this case, cloud-aws)...
# Just pass a string block to the config key, it works for any plugin.
#
#elasticsearch_plugins:
#  - name: elasticsearch/elasticsearch-cloud-aws/2.3.0
#    config: |
#    # cloud-aws configuration
#      cloud:
#        aws:
#          access_key: <your access key>
#          secret_key: <your secret key>
#      discovery:
#        type: ec2
#      repositories:
#        bucket: <the bucket created in s3>

# A list of plugins to install or delete.
elasticsearch_plugins: []

# ---- Libraries ----

# Examples:
#
# The url is required, everything else is optional.
#
#
#elasticsearch_libs:
#  url: 'http://somewebsite.com/foo.jar'
#
#
#elasticsearch_libs:
#  url: 'http://somewebsite.com/foo.jar'
#  file: 'differentfilename.jar'
#  delete: True
#
#
#elasticsearch_libs:
#  url: 'http://somewebsite.com/foo.jar'
#  user: 'basicauthuser'
#  pass: 'basicauthpass'

# A list of libraries to install or delete.
elasticsearch_libs: []

# ---- Memory and filesystem ----

elasticsearch_memory_mlockall: false

# The heap size should be about 50% of your total RAM on a dedicated instance.
# If you are running ES with a bunch of other services don't be afraid to
# drastically lower this but be aware of performance issues if it's too low.
elasticsearch_memory_heap_size_multiplier: 0.5

elasticsearch_memory_heap_newsize: ''
elasticsearch_memory_direct_size: ''
elasticsearch_memory_locked_size: 'unlimited'
elasticsearch_memory_vma_max_map_count: 262144
elasticsearch_fs_max_open_files: 65535

# Force ES to use ipv4, set this to an empty string if you want to use ipv6.
elasticsearch_fs_java_opts: '-Djava.net.preferIPv4Stack=true'


# elasticsearch.yml

elasticsearch_cluster_name: elasticsearch

elasticsearch_node_name: ~
elasticsearch_node_master: true
elasticsearch_node_data: true
elasticsearch_node_rack: ~
elasticsearch_node_max_local_storage_nodes: ~  # 1

elasticsearch_index_number_of_shards: 5
elasticsearch_index_number_of_replicas: 1

elasticsearch_path_conf: ~
elasticsearch_path_data: ~
elasticsearch_path_work: ~
elasticsearch_path_logs: ~
elasticsearch_path_plugins: ~

elasticsearch_plugin_mandatory: ~

elasticsearch_bootstrap_mlockall: false

elasticsearch_network_bind_host: ~
elasticsearch_network_publish_host: ~
elasticsearch_network_host: "{{ ansible_eth0.ipv4.address }}"
elasticsearch_transport_tcp_port: 9300
elasticsearch_transport_tcp_compress: true
elasticsearch_http_port: 9200
elasticsearch_http_max_content_length: 100mb
elasticsearch_http_enabled: true

elasticsearch_gateway_type: local
elasticsearch_gateway_recover_after_nodes: 1
elasticsearch_gateway_recover_after_time: 5m
elasticsearch_gateway_expected_nodes: 2

elasticsearch_cluster_routing_allocation_node_initial_primaries_recoveries: ~  # 4
elasticsearch_cluster_routing_allocation_node_concurrent_recoveries: ~         # 2
elasticsearch_indices_recovery_max_bytes_per_sec: ~                            # 20mb
elasticsearch_indices_recovery_concurrent_streams: ~                           # 5

elasticsearch_discovery_zen_minimum_master_nodes: ~    # 1
elasticsearch_discovery_zen_ping_timeout: ~            # 3s
elasticsearch_discovery_zen_ping_multicast_enabled: ~  # false
elasticsearch_discovery_zen_ping_unicast_hosts: ~      # "[\"host1\", \"host2:port\"]"

elasticsearch_index_search_slowlog_threshold_query_warn: ~     # 10s
elasticsearch_index_search_slowlog_threshold_query_info: ~     # 5s
elasticsearch_index_search_slowlog_threshold_query_debug: ~    # 2s
elasticsearch_index_search_slowlog_threshold_query_trace: ~    # 500ms
elasticsearch_index_search_slowlog_threshold_fetch_warn: ~     # 1s
elasticsearch_index_search_slowlog_threshold_fetch_info: ~     # 800ms
elasticsearch_index_search_slowlog_threshold_fetch_debug: ~    # 500ms
elasticsearch_index_search_slowlog_threshold_fetch_trace: ~    # 200ms
elasticsearch_index_indexing_slowlog_threshold_index_warn: ~   # 10s
elasticsearch_index_indexing_slowlog_threshold_index_info: ~   # 5s
elasticsearch_index_indexing_slowlog_threshold_index_debug: ~  # 2s
elasticsearch_index_indexing_slowlog_threshold_index_trace: ~  # 500ms

monitor_jvm_gc_young_warn: ~   # 1000ms
monitor_jvm_gc_young_info: ~   # 700ms
monitor_jvm_gc_young_debug: ~  # 400ms
monitor_jvm_gc_old_warn: ~     # 10s
monitor_jvm_gc_old_info: ~     # 5s
monitor_jvm_gc_old_debug: ~    # 2s

elasticsearch_http_jsonp_enabled: false

# logging.yml

elasticsearch_logging_template: logging.yml.j2
```

## Example Playbook

```yaml
- hosts: servers
  roles:
    - playlist.elasticsearch
```

## Testing

```
$ git clone https://github.com/playlist-ansible/elasticsearch.git
$ cd elasticsearch
$ make
```
