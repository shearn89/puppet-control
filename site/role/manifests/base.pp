class role::base {

  user { 'admin':
    ensure         => present,
    forcelocal     => true,
    groups         => [ 'wheel' ],
    home           => '/home/admin',
    managehome     => true,
    password       => Sensitive(pw_hash('adminpassword'), 6),
    purge_ssh_keys => true,
  }

  include ::toughen
}
