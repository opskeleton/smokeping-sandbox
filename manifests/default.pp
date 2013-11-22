group{ 'puppet': ensure  => present }

node default {

  $probes = [
    {name => 'FPing', binary  => '/usr/bin/fping'},
    {name => 'DNS', binary => '/usr/bin/dig'},
  ]

  package{'sendmail':
    ensure  => present
  }

  class {'smokeping':
    mode   => 'standalone',
    probes => $probes,
  }

  smokeping::target { 'World':
    menu      => 'World',
    pagetitle => 'Connection to the World',
  }

  smokeping::target { 'Google':
    hierarchy_parent => 'World',
    hierarchy_level  => 2,
    menu             => 'google.com',
    pagetitle        => 'Google',
  }

  smokeping::target { 'Google-fping':
    hierarchy_parent => 'Google',
    hierarchy_level  => 3,
    menu             => 'google.com ping',
    host             => 'google.com',
  }

  smokeping::target { 'Google-DNS':
    hierarchy_parent => 'Google',
    hierarchy_level  => 3,
    probe            => 'DNS',
    menu             => 'google.com dns',
    host             => '8.8.8.8',
  }

}
