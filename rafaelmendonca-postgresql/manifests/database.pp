class postgresql::database(
	$dbuser = '', 
	$dbname = '', 
) {

# Depedencia.
require postgresql::package

 exec { "dbuser-$dbuser":
    command => "su - postgres -c 'createuser ${dbuser} --no-superuser --no-createdb --no-createrole' && touch /var/lib/pgsql/.puppet_${dbuser}.ver",
    path => '/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    unless => "test -f /var/lib/pgsql/.puppet_${dbuser}.ver",
  }
 exec { "dbname-$dbname":
    command => "su - postgres -c 'createdb ${dbname} --owner=${dbuser}'",
    path => '/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    unless => "su - postgres -c '/usr/bin/psql -l' | grep ${dbname} ",
    provider => 'shell',
    require => Exec["dbuser-$dbuser"],
  }
}  # END define

