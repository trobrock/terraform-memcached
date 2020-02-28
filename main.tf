resource "aws_security_group" "memcached" {
  name   = "${var.name}-memcached"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 11211
    to_port         = 11211
    protocol        = "tcp"
    security_groups = var.security_groups
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "private" {
  name       = "${var.name}-memcached-private"
  subnet_ids = var.subnets
}

resource "aws_elasticache_cluster" "memcached" {
  cluster_id         = "${var.name}-m"
  engine             = "memcached"
  node_type          = var.cache_instance_size
  num_cache_nodes    = 1
  engine_version     = var.engine_version
  subnet_group_name  = aws_elasticache_subnet_group.private.name
  security_group_ids = [aws_security_group.memcached.id]
}
