require 'serverspec'
require 'winrm'
require 'yaml'

include SpecInfra::Helper::WinRM
include SpecInfra::Helper::Windows

properties = ['properties.yml', 'secret.yml'].inject({}) { |h, f|
  h.merge(YAML.load_file(f)) { |key, old, new| old.merge(new) }
}

RSpec.configure do |c|
  c.host  = ENV['TARGET_HOST']
  set_property properties[c.host]

  user = property[:user]
  pass = property[:pass]
  endpoint = "http://#{c.host}:5985/wsman"

  c.winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user, :pass => pass, :basic_auth_only => true)
  c.winrm.set_timeout 30
end
