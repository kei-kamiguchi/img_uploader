server '54.168.214.21', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kei/.ssh/id_rsa'
