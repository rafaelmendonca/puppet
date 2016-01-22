class postfix (
	$confdir	= $postfix::params::postfix_confdir,
	$confmain	= $postfix::params::postfix_confmain,
	$confmaster	= $postfix::params::postfix_confmaster,
	$myorigin 	= $postfix::params::postfix_myorigin,
	$mydestination	= $postfix::params::postfix_mydestination,
	$relayhost	= $postfix::params::postfix_relayhost,
	$conftransport	= $postfix::params::postfix_conftransport,
) inherits postfix::params {
  File { 
   ensure  => file,
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
  }
  package {"postfix": 
    ensure	=> "present",
  }
  # File 
  file {"file_${confmain}":
    path    => "${confdir}/${confmain}",
    content => template('postfix/confs/main.cf.erb'),
  }
  file {"file_${confmaster}":
    path    => "${confdir}/${confmaster}",
    content => template('postfix/confs/master.cf.erb'),
  }
  file {"file_${conftransport}":
    path    => "${confdir}/${conftransport}",
    content => template('postfix/confs/transport.erb'),
  }
  exec { "postmap_file_${conftransport}":
    command	=> "postmap ${confdir}/${conftransport}",
    path        => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin",
    subscribe   => File["file_${conftransport}"],
    refreshonly => true
  }

  file {"file_command_filter":
    path    => "${confdir}/command_filter",
    content => template('postfix/confs/command_filter.erb'),
  }
  exec { "postmap_file_filter":
    command	=> "postmap ${confdir}/command_filter",
    path        => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin",
    subscribe   => File["file_command_filter"],
    refreshonly => true
  }
}
