class postgresql::package (
  $data_directory            = $postgresql::params::postgresql_data_directory,
  $hba_file                  = $postgresql::params::postgresql_hba_file,
  $ident_file                = $postgresql::params::postgresql_ident_file,
  $external_pid_file         = $postgresql::params::postgresql_external_pid_file,
  $listen_addresses          = $postgresql::params::postgresql_listen_addresses,
  $port                      = $postgresql::params::postgresql_port,
  $max_connections           = $postgresql::params::postgresql_max_connections,
  $unix_socket_directories   = $postgresql::params::postgresql_unix_socket_directories,
  $unix_socket_group         = $postgresql::params::postgresql_unix_socket_group,
  $unix_socket_permissions   = $postgresql::params::postgresql_unix_socket_permissions,
  $bonjour                   = $postgresql::params::postgresql_bonjour,
  $bonjour_name              = $postgresql::params::postgresql_bonjour_name,
  $authentication_timeout    = $postgresql::params::postgresql_authentication_timeout,
  $ssl                       = $postgresql::params::postgresql_ssl,
  $ssl_ciphers               = $postgresql::params::postgresql_ssl_ciphers,
  $ssl_renegotiation_limit   = $postgresql::params::postgresql_ssl_renegotiation_limit,
  $ssl_cert_file             = $postgresql::params::postgresql_ssl_cert_file,
  $ssl_key_file              = $postgresql::params::postgresql_ssl_key_file,
  $ssl_ca_file               = $postgresql::params::postgresql_ssl_ca_file,
  $ssl_crl_file              = $postgresql::params::postgresql_ssl_crl_file,
  $password_encryption       = $postgresql::params::postgresql_password_encryption,
  $db_user_namespace         = $postgresql::params::postgresql_db_user_namespace,
  $krb_server_keyfile        = $postgresql::params::postgresql_krb_server_keyfile,
  $krb_srvname               = $postgresql::params::postgresql_krb_srvname,
  $krb_caseins_users         = $postgresql::params::postgresql_krb_caseins_users,
  $tcp_keepalives_idle       = $postgresql::params::postgresql_tcp_keepalives_idle,
  $tcp_keepalives_interval   = $postgresql::params::postgresql_tcp_keepalives_interval,
  $tcp_keepalives_count      = $postgresql::params::postgresql_tcp_keepalives_count,
  $shared_buffers            = $postgresql::params::postgresql_shared_buffers,
  $temp_buffers              = $postgresql::params::postgresql_temp_buffers,
  $max_prepared_transactions = $postgresql::params::postgresql_max_prepared_transactions,
  $work_mem                  = $postgresql::params::postgresql_work_mem,
  $maintenance_work_mem      = $postgresql::params::postgresql_maintenance_work_mem,
  $max_stack_depth           = $postgresql::params::postgresql_max_stack_depth,

) inherits postgresql::params { 
#  $postgresql_version	= '9.1'
  case $::operatingsystem {
    'ubuntu', 'debian' : { 
      package { "postgresql-server-dev-${postgresql_version}":
        ensure  => present,
	notify  => Exec['startdb'],
      }   
    }   
    default : { 
      exec {'pgdg_redhat': 
	command => 'wget http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm -O /tmp/pgdg-redhat.noarch.rpm',
	path   => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/sbin/:/bin",
	unless => 'rpm -qa | grep pgdg-redhat',
      } 
      package {"install_pgdg_redhat": 
	name 	=> "pgdg-redhat93",
	source	=> "/tmp/pgdg-redhat.noarch.rpm",
	provider => "rpm",
	require	=> Exec['pgdg_redhat'],
	notify	=> Package['postgresql93-server'],
      } 
      package {"postgresql93-server": 
	ensure	=> present,
	notify	=> Package['postgresql93-contrib'],
      }
      package {"postgresql93-contrib": 
	ensure	=> present,
      }
 
	
     }
   }
   exec {'startdb': 
	path	=> '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
	command => 'service postgresql-9.3 initdb',
	unless => 'ls /var/lib/pgsql/9.3/data/postgresql.conf',
   } 

  file { '/var/lib/pgsql/9.3/data/postgresql.conf':
    ensure  => present,
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0600',
    content => template('postgresql/postgresql.conf.erb'),
  }
  file { '/var/lib/pgsql/9.3/data/pg_hba.conf ':
    ensure  => present,
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0600',
    content => template('postgresql/pg_hba.conf.erb'),
  }

#  service {'postgresql-9.3':
#        ensure    => running,
#        enable    => true,
#	subscribe => File['/var/lib/pgsql/9.3/data/postgresql.conf'],
#  }

} 
