require 'dockerspec/serverspec'

describe 'Dockerfile' do
  describe docker_build(path: '../Dockerfile') do

    it { should have_user 'europa' }

    describe docker_run(described_image) do
      describe package('postgresql-client') do
        it { should be_installed }
      end
      # Check OS version
      describe command("lsb_release -a") do
        its(:stdout) { should match /Ubuntu 16.04/ }
      end
      # Check date time setting
      describe command('date') do
        its(:stdout) { should match /JST/ }
      end
      # Check Language environment
      describe command('env') do
        its(:stdout) { should match /LANG=ja_JP.UTF-8/ }
        its(:stdout) { should match /LC_ALL=ja_JP.UTF-8/ }
        its(:stdout) { should match /LC_CTYPE=ja_JP.UTF-8/ }
      end
    end

  end
end
