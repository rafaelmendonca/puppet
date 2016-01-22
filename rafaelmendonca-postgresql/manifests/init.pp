# == Class: postgresql
#
# Full description of class postgresql here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Definições de variaveis do Postgresql Server.
#
# [*postgresql_data_directory*]
# Caminho do diretório do Postgres.
# <tt>Valor Default: undef </tt> 
#
# [*postgresql_hba_file*]
# Caminho do arquivo pg_hba.conf. 
# <tt>Valor Default: undef</tt> 
# 
# [*postgresql_ident_file*]
# Caminho do arquivo pg_ident.conf. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_external_pid_file*]
# Caminho para escrever um arquivo extra PID. 
# <tt>Valor Default: undef</tt>
#
# [*postgresql_listen_addresses*]
# Interface que postgresql irá rodar. 
# <tt>Valor Default: *</tt>
#
# [*postgresql_port*]
# Porta que o Postgresql irá rodar.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_max_connections*]
# Aumentar max_connections custa ~400 bytes de memória compartilhada por
# Slot de conexão, além de espaço de bloqueio (ver max_locks_per_transaction).
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_unix_socket_directories*]
# Diretorio Unix socket. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_unix_socket_group*]
# Grupo Unix socket. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_unix_socket_permissions*]
# Permissão Unix socket. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_bonjour*]
# Anunciar servidor via Bonjour
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_bonjour_name*]
# O padrão é o nome do computador.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_authentication_timeout*]
# Timeout de autenticação. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl*]
# Autenticação SSL. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl_ciphers*]
# SSL ciphers permitidos.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl_renegotiation_limit*]
# Quantidade de dados entre renegociação SSL.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl_cert_file*]
# Arquivo de certificado SSL. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl_key_file*]
# Chave do certificado SSL. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl_ca_file*]
# Arquivo da CA. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_ssl_crl_file*]
# Arquivo da CRL. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_password_encryption*]
# Encriptação de password.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_krb_server_keyfile*]
# Kerberos Server File. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_krb_srvname*]
# Kerberos Server Name.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_krb_caseins_users*]
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_tcp_keepalives_idle*]
# TCP_KEEPIDLE, em segundos.
# <tt>Valor Default: 60</tt> 
#
# [*postgresql_tcp_keepalives_interval*]
# TCP_KEEPINTVL, em segundos.
# <tt>Valor Default: 30</tt> 
#
# [*postgresql_tcp_keepalives_count*]
# TCP_KEEPICTL.
# <tt>Valor Default: 2</tt> 
#
# [*postgresql_shared_buffers*]
# Memória compartilhada. 
# <tt>Valor Default: 128kB</tt> 
#
# [*postgresql_temp_buffers*]
# Memória compartilhada. 
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_max_prepared_transactions*]
# Aumentar max_prepared_transactions custa aproximadamente 600 bytes de memória compartilhada
# por slot transação, além de espaço de bloqueio (ver max_locks_per_transaction).
# Não é aconselhável para definir max_prepared_transactions diferentes de zero a menos que você
# intenção ativamente para usar transações preparadas.
# <tt>Valor Default: undef</tt> 
#
# [*postgresql_work_mem*]
# <tt>Valor Default: 16MB</tt> 
#
# [*postgresql_maintenance_work_mem*]
# <tt>Valor Default: 500MB</tt> 
#
# [*postgresql_max_stack_depth*]
# Memória compartilhada. 
# <tt>Valor Default: undef</tt> 
#
#
#
#
#
#
#
# === Exemplos
#
#  class { postgresql:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Autores
#
# Rafael Mendonça <rafael.mendonca@4linux.com.br>
#
# === Copyright
#
# Copyright 2014 4Linux Open Software Specialists.
#
class postgresql {
include postgresql::package

# class { 'postgresql::database':
#	   dbname   => "zabbix-server",
#	   dbuser   => "zabbix-server",
#	}
# class { 'postgresql::database':
#	   dbname   => "zabbix-proxy",
#	   dbuser   => "zabbix-proxy",
#	}


}
