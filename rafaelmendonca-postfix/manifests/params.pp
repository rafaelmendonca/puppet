class postfix::params { 
# Parametros do Postfix
	$postfix_confdir = "/etc/postfix"
	$postfix_confmain = "main.cf"
	$postfix_confmaster = "master.cf"
	$postfix_myorigin = "${::hostname}"
	$postfix_mydestination = "${::hostname}.${::domain}"
	$postfix_relayhost = "${::domain}"
	$postfix_conftransport = "transport"
}
