# Fixes the Apache 500 error: wp-settings.php requires a file ending in
# ".phpp" (a typo), so the extension is corrected to ".php"
exec { 'fix-wordpress':
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path    => ['/bin', '/usr/bin', '/usr/local/bin'],
}
