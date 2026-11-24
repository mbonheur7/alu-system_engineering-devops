# Raises the open file limit of Nginx so it can handle many concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/bin', '/usr/bin', '/usr/local/bin'],
}

exec { 'restart-nginx':
  command     => 'service nginx restart',
  path        => ['/bin', '/usr/bin', '/usr/sbin', '/sbin'],
  subscribe   => Exec['fix--for-nginx'],
  refreshonly => true,
}
