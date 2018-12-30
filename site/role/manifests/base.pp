class role::base (
  Sensitive[String] $admin_password = 'password'
){

  $default_password = Sensitive(pw_hash($admin_password, 'SHA-512', fqdn_rand_string(16)))

  user { 'admin':
    ensure         => present,
    forcelocal     => true,
    groups         => [ 'wheel' ],
    home           => '/home/admin',
    managehome     => true,
    password       => $default_password,
    purge_ssh_keys => true,
  }

  include ::toughen
}
