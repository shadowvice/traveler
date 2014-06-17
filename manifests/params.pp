#== Class: bash
# This is my attempt to manage my bash_profile.
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
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { bash:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class bash::params {
  # Determine the Operating system.
  case $::operatingsystem{
    # Redhat Systems: rhel, fedora, centos, scientific
    rhel:    {
      $bashShell      = '/bin/bash'
      $bashUser       = 'jlebouef'
      $packageBash    = 'bash'
      $packageBashAdd = 'bash-completion'
    }
    
    # Mac OS's - Incase these are different
    mac:     {
      $bashShell      = '/bin/bash'
      $bashUser       = 'jlebouef'
      $packageBash    = 'bash'
      $packageBashAdd = 'bash-completion'
    }
    
    # Ubuntu - Really should debian but for now
    Ubuntu:  {
      $bashShell      = '/bin/bash'
      $bashUser       = 'jlebouef'
      $packageBash    = 'bash'
      $packageBashAdd = 'bash-completion'
    }
  
    # Windows - Not sure of the approach here... maybe cygwin or putty
    windows: {
      $bashShell      = '/bin/bash'
      $bashUser       = 'jlebouef'
      $packageBash    = 'bash'
      $packageBashAdd = 'bash-completion'
    }
    
    default: {fail("The ${::operatingsystem} has not been configured for this module")}
  }

}
