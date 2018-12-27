class role::base {

  user { 'admin':
    ensure         => present,
    forcelocal     => true,
    groups         => [ 'wheel' ],
    home           => '/home/admin',
    managehome     => true,
    password       => Sensitive(str2saltedsha512('adminpassword')),
    purge_ssh_keys => true,
  }

  include ::toughen
}
