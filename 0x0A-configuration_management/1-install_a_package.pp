exec { 'install puppet-lint':
  command => '/usr/bin/apt-get -y install puppet-lint=2.5.0',
  path    => ['/usr/bin'],
}
