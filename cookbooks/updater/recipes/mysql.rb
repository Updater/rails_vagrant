apt_repository 'mysql' do
  uri 'http://repo.mysql.com/apt/ubuntu/'
  distribution node['lsb']['codename']
  components ['mysql-5.7']
  keyserver 'keys.gnupg.net'
  key '5072E1F5'
  deb_src true
end

package 'mysql-client'
package 'libmysqlclient-dev'

mysql_service 'default' do
  version '5.7'
  package_version '5.7.19-1ubuntu14.04'
  package_name 'mysql-server'
  port '3306'
  data_dir '/var/lib/mysql'
  initial_root_password ''
  action :create
end


bash "mysql create initial records" do
  code "sudo mysql -e \"ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';\""
  umask '022'
  action :run
end
