# This Puppet manifest ensures the creation of a file at /tmp/school with specified permissions, owner, group, and content.

file { '/tmp/school':
    ensure  => 'file',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0744',
    content => 'I love Puppet',
}
