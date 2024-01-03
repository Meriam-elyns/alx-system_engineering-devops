# Automating Nginx Configuration with Puppet

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file_line { 'redirect_config':
  ensure => present,
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => 'return 301 /redirect_me https://www.github.com/Meriam-elyns permanent;',
  notify => Service['nginx'],
}

# Create index.html with "Hello World!"
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# Start and enable Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
  require => Package['nginx'],
}
