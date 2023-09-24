#!/usr/bin/env bash
# using puppet to make changes to onfiguration file

file { 'ect/ssh/ssh_config':
	ensure => present,

content =>"

	#SSH client configuration
	host*	
	IdentityFile ~/.ssh/school
	PasswordAuthentication no

}