# encoding: utf-8
# copyright: 2018, The Authors

title 'cookies-policy'

# you can also use plain tests
#describe file('/tmp') do
#  it { should be_directory }
#end

# you add controls here
control 'ASVS-14.4.4' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Content type Options = no sniff'
  desc 'All responses should contain X-Content-Type-Options=nosniff'
  describe http('http://192.168.0.6:3000') do                  # The actual test
    its('headers.content-type-options') { should cmp 'nosniff' } 
  end
end

control 'ASVS-14.4.7' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'X Frame Options or Content Security policy set'             # A human-readable title
  desc 'All responses should include X Frame Options or Content Security Policy'
  describe http('http://192.168.0.6:3000') do                  # The actual test
    its('x-frame-options') { should cmp 'SAMEORIGIN' }
  end
end


control 'ASVS-14.4.1' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'All responses should contain X-Content-Type-Options=nosniff'
  describe http('http://192.168.0.6:3000') do                  # The actual test
    its('Content-type') { should cmp 'text/html; charset=utf-8' }
  end
end
