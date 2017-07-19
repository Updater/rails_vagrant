execute 'fix rvm vagrant permissions' do
  command "chown -R vagrant:vagrant /home/vagrant/.rvm"
  only_if "ls -Rl /home/vagrant/.rvm |grep -q root"
end
