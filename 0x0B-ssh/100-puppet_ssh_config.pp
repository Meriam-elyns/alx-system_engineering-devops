#!/usr/bin/env bash
# using pippet to make changes to our configuration file

file { 'ect/ssh/ssh_cofig':
	ensure => present,

content =>"
	#SSH client configuration
	host*
	IdentityFile ~/.ssh/school
	PasswordAuthentication no
	",

}
