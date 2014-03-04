require 'spec_helper'

describe file('c:/windows') do
  it { should be_directory }
end

describe command('whoami') do
  it { should return_stdout /administrator/ }
end

describe service('WinRM') do
  it { should be_running }
end
