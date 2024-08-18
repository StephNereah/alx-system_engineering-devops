# This Puppet script fixes the Apache 500 error by adjusting file permissions.

exec { 'replace_phpp_with_php':
  command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  provider => shell,
  onlyif   => 'grep "phpp" /var/www/html/wp-settings.php',
}
