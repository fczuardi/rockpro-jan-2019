# on the outside machine...

# add key to authorized_keys files to login without password
ssh-copy-id rock64@kim.local

# copy kitty .terminfo to target machine
kitty +kitten ssh rock64@kim.local

# edit ssh config to add an alias to the long onion hostname
# use torsocks ssh to access the onion ssh server

