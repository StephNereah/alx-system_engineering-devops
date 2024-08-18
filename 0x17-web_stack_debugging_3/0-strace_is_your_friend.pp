# Puppet manifest to fix the Apache issue

exec { 'fix-apache-permissions':
  command => '/bin/chmod -R 755 /var/www/html',
  onlyif  => '/usr/bin/test -d /var/www/html',
}

file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => file,
  mode    => '0644',
  content => template('apache/000-default.conf.erb'),
  notify  => Exec['restart-apache'],
}

exec { 'restart-apache':
  command     => '/bin/systemctl restart apache2',
  refreshonly => true,
}
