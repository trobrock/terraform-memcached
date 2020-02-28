output "url" {
  value = "${aws_elasticache_cluster.memcached.cache_nodes[0].address}:11211"
}
