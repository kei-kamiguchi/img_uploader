server '52.193.137.160', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kei/.ssh/id_rsa'
