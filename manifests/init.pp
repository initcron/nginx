class nginx {

      file{'/usr/local/src/nginx-1.0.9.tar.gz'
        ensure  => present,
	owner   => root,
	group   => root,
	source  => 'file://module/nginx/nginx-1.0.9.tar.gz',
      }



}