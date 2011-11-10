class nginx {

      package{['build-essential']:
        ensure   => present,
      }

      package{['libpcre3']:
        ensure   => present,
      }

      
      file{'/usr/local/src/nginx-1.0.9.tar.gz':
        ensure  => present,
	owner   => root,
	group   => root,
	source  => 'puppet:///modules/nginx/nginx-1.0.9.tar.gz',
      }

      exec{'extract_nginx_source':
        path     => ['/usr/local/bin', '/opt/local/bin', '/usr/bin', '/usr/sbin', '/bin', '/sbin'],
	command  => "tar -xzf nginx-1.0.9.tar.gz",
	cwd      => "/usr/local/src", 
	creates  => "/usr/local/src/nginx-1.0.9",
	require  => File['/usr/local/src/nginx-1.0.9.tar.gz'],
      }

      exec{'configure_nginx':
        path     => ['/usr/local/bin', '/opt/local/bin', '/usr/bin', '/usr/sbin', '/bin', '/sbin'],
        command  => "./configure",
        cwd      => "/usr/local/src/nginx-1.0.9",
        #creates  => "/usr/local/src/nginx-1.0.9",
        require  => [Exec['extract_nginx_source'], Package['build-essential'], Package[libpcre3] ],
      }

}