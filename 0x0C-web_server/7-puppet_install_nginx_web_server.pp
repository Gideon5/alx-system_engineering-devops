# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Ensure Nginx service is enabled and running
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

# Create an Nginx virtual host configuration for the default site
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
        listen 80;
        server_name _;

        location / {
            return 301 https://\$host\$request_uri;
        }

        location /redirect_me {
            return 301 \$scheme://\$host\$request_uri;
        }
    }
  ",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Create a custom HTML file
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Enable the default site by creating a symbolic link in sites-enabled
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify => Service['nginx'],
}

