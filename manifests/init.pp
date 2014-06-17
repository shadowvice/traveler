# == Class: core
#
# This contains the default program for any system that I would load.
# The key is to avoid redeclaring packages in multiple manifests BUT keep the manifest small 
# with the goal of roughly one page
class core 

# user a selector !!!
# Perhaps instead of declaring a case, create a selector on each case
# AHHH but then I need to have seperate case for each variable!!!!!
# Always add your defaulat
case $::operatingsystem {
    # Declare OS before going forward
    
    # RedHat
    'RedHat', 'CentOS': { 
    # Maybe throw in the following
    include core::redhat
    } # include role::redhat  }, # apply the redhat class
    /^(Debian|Ubuntu)$/:{ 
      $packages = ['apache2',
                   'audacity', 
                   'chromium-browser', 
                   'firefox',
                   'gimp', 
                   'git',
                   'handbrake',
                   'htop',
                   'irssi',
                   'irssi-scripts',
                   'puppet', 
                   'puppet-common', 
                   'vim',
                   'wine*'],

      $servicesAllowed = ['apache2',
                          'htop',
                          'irssi',
                          'vim'],

      $servicesNoAllow = ['notsureyet',
                          'neitherhere'],
    }
    default:            { } #include role::generic }, # apply the generic class
    }


    $packages = ['apache2',
                 'audacity', 
                 'chromium-browser', 
                 'firefox',
                 'gimp', 
                 'git',
                 'handbrake',
                 'htop',
                 'irssi',
                 'irssi-scripts',
                 'puppet', 
                 'puppet-common', 
                 'vim',
                 'wine*'],

    $servicesAllowed = ['apache2',
                        'htop',
                        'irssi',
                        'vim'],

    $servicesNoAllow = ['notsureyet',
                        'neitherhere'],


{
  package { $packages:
    ensure   => installed
    }

  service { $serviceAllowed:
    ensure    => running,
    }


}
