group{ 'puppet': ensure  => present }

node default {
 include smokeping::defaults
}
