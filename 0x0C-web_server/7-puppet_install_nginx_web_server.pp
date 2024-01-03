# automating my work using Puppet
package { 'ngnix':
ensure => installed,
}
file_line { 'install':
ensure => 'present',
path => '/ect/nginx/sites-enabled/default',
after => 'listen 80 default_server;',
line => 'newrite ^/redirect_me https://www.github.com/Meriam-elyns permanent; ',
}
file { '/var/www/html/index.html':
content =>'Hello World!',
}
service { 'nginx':
ensure => running,
require => package['nginx'],
}
