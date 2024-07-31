# Puppet manifest to configure SSH client to use a specific private key and disable password authentication

# Ensure the SSH client configuration file exists
file { '/etc/ssh/ssh_config':
  ensure => file,
  mode   => '0644',
}

# Add a configuration line to use the specified private key
file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
  ensure => present,
}

# Disable password authentication
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
  ensure => present,
}
