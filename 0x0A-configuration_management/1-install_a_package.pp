# This Puppet manifest ensures that Flask version 2.1.0 is installed using pip3.

package { 'flask':
    ensure  => 'pip3',
    content => '2.1.0',
}
