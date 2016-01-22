class postgresql::params { 
  # Postgresql Server Params
 if $postgresql_data_directory { $postgresql_data_directory  =  "$postgresql_data_directory" }
 else { $postgresql_data_directory = undef }

 if $postgresql_hba_file { $postgresql_hba_file  =  "$postgresql_hba_file" }
 else { $postgresql_hba_file = undef }

 if $postgresql_ident_file { $postgresql_ident_file  =  "$postgresql_ident_file" }
 else { $postgresql_ident_file = undef }

 if $postgresql_external_pid_file { $postgresql_external_pid_file  =  "$postgresql_external_pid_file" }
 else { $postgresql_external_pid_file = undef }

 if $postgresql_listen_addresses { $postgresql_listen_addresses  =  "$postgresql_listen_addresses" }
 else { $postgresql_listen_addresses = '*' }

 if $postgresql_port { $postgresql_port  =  "$postgresql_port" }
 else { $postgresql_port = undef }

 if $postgresql_max_connections { $postgresql_max_connections  =  "$postgresql_max_connections" }
 else { $postgresql_max_connections = '100' }

 if $postgresql_unix_socket_directories { $postgresql_unix_socket_directories  =  "$postgresql_unix_socket_directories" }
 else { $postgresql_unix_socket_directories = undef }

 if $postgresql_unix_socket_group { $postgresql_unix_socket_group  =  "$postgresql_unix_socket_group" }
 else { $postgresql_unix_socket_group = undef }

 if $postgresql_unix_socket_permissions { $postgresql_unix_socket_permissions  =  "$postgresql_unix_socket_permissions" }
 else { $postgresql_unix_socket_permissions = undef }

 if $postgresql_bonjour { $postgresql_bonjour  =  "$postgresql_bonjour" }
 else { $postgresql_bonjour = undef }

 if $postgresql_bonjour_name { $postgresql_bonjour_name  =  "$postgresql_bonjour_name" }
 else { $postgresql_bonjour_name = undef }

 if $postgresql_authentication_timeout { $postgresql_authentication_timeout  =  "$postgresql_authentication_timeout" }
 else { $postgresql_authentication_timeout = undef }

 if $postgresql_ssl { $postgresql_ssl  =  "$postgresql_ssl" }
 else { $postgresql_ssl = undef }

 if $postgresql_ssl_ciphers { $postgresql_ssl_ciphers  =  "$postgresql_ssl_ciphers" }
 else { $postgresql_ssl_ciphers = undef }

 if $postgresql_ssl_renegotiation_limit { $postgresql_ssl_renegotiation_limit  =  "$postgresql_ssl_renegotiation_limit" }
 else { $postgresql_ssl_renegotiation_limit = undef }

 if $postgresql_ssl_cert_file { $postgresql_ssl_cert_file  =  "$postgresql_ssl_cert_file" }
 else { $postgresql_ssl_cert_file = undef }

 if $postgresql_ssl_key_file { $postgresql_ssl_key_file  =  "$postgresql_ssl_key_file" }
 else { $postgresql_ssl_key_file = undef }

 if $postgresql_ssl_ca_file { $postgresql_ssl_ca_file  =  "$postgresql_ssl_ca_file" }
 else { $postgresql_ssl_ca_file = undef }

 if $postgresql_ssl_crl_file { $postgresql_ssl_crl_file  =  "$postgresql_ssl_crl_file" }
 else { $postgresql_ssl_crl_file = undef }

 if $postgresql_password_encryption { $postgresql_password_encryption  =  "$postgresql_password_encryption" }
 else { $postgresql_password_encryption = undef }

 if $postgresql_db_user_namespace { $postgresql_db_user_namespace  =  "$postgresql_db_user_namespace" }
 else { $postgresql_db_user_namespace = undef }

 if $postgresql_krb_server_keyfile { $postgresql_krb_server_keyfile  =  "$postgresql_krb_server_keyfile" }
 else { $postgresql_krb_server_keyfile = undef }

 if $postgresql_krb_srvname { $postgresql_krb_srvname  =  "$postgresql_krb_srvname" }
 else { $postgresql_krb_srvname = undef }

 if $postgresql_krb_caseins_users { $postgresql_krb_caseins_users  =  "$postgresql_krb_caseins_users" }
 else { $postgresql_krb_caseins_users = undef }

 if $postgresql_tcp_keepalives_idle { $postgresql_tcp_keepalives_idle  =  "$postgresql_tcp_keepalives_idle" }
 else { $postgresql_tcp_keepalives_idle = '60' }

 if $postgresql_tcp_keepalives_interval { $postgresql_tcp_keepalives_interval  =  "$postgresql_tcp_keepalives_interval" }
 else { $postgresql_tcp_keepalives_interval = '30' }

 if $postgresql_tcp_keepalives_count { $postgresql_tcp_keepalives_count  =  "$postgresql_tcp_keepalives_count" }
 else { $postgresql_tcp_keepalives_count = '2' }

 if $postgresql_shared_buffers { $postgresql_shared_buffers  =  "$postgresql_shared_buffers" }
 else { $postgresql_shared_buffers = '128kB' }

 if $postgresql_temp_buffers { $postgresql_temp_buffers  =  "$postgresql_temp_buffers" }
 else { $postgresql_temp_buffers = undef }

 if $postgresql_max_prepared_transactions { $postgresql_max_prepared_transactions  =  "$postgresql_max_prepared_transactions" }
 else { $postgresql_max_prepared_transactions = undef }

 if $postgresql_work_mem { $postgresql_work_mem  =  "$postgresql_work_mem" }
 else { $postgresql_work_mem = '16MB' }

 if $postgresql_maintenance_work_mem { $postgresql_maintenance_work_mem  =  "$postgresql_maintenance_work_mem" }
 else { $postgresql_maintenance_work_mem = '500MB' }

 if $postgresql_max_stack_depth { $postgresql_max_stack_depth  =  "$postgresql_max_stack_depth" }
 else { $postgresql_max_stack_depth = undef }










} 
