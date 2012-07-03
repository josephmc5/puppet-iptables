class iptables($service=running, $enable=true) {
    file  {"/etc/init.d/iptables":
        source => 'puppet:///modules/iptables/init.iptables',
        path   => '/etc/init.d/iptables',
        owner  => 'root',
        group  => 'root',
    }
    file {"/etc/iptables.d":
        path    => '/etc/iptables.d',
        owner   =>  'root',
        group   =>  'root',
        ensure  => directory,
    }
    file {"10default":
        path    => '/etc/iptables.d/10default',
        owner   =>  'root',
        group   =>  'root',
        ensure  => present,
        content => template("iptables/10default.erb"),
        notify  => Service["iptables"]
    }
    file {"50local":
        path    => '/etc/iptables.d/50local',
        owner   =>  'root',
        group   =>  'root',
        ensure  => present,
        content => template("iptables/50local.erb"),
        notify  => Service["iptables"]
    }
    file {"99logging":
        path    => "/etc/iptables.d/99logging",
        owner   =>  'root',
        group   =>  'root',
        ensure  => present,
        content => template("iptables/99logging.erb"),
        notify  => Service["iptables"]
    }
    service { "iptables":
        ensure     => $service,
        enable     => $enable,
        hasstatus  => true,
        hasrestart => true,
        require =>  File['/etc/init.d/iptables']
    }
}
