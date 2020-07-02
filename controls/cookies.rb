# encoding: utf-8
# copyright: 2018, The Authors

title 'cookies-policy'

# you can also use plain tests
#describe file('/tmp') do
#  it { should be_directory }
#end

# you add controls here
control 'HTTP Header - Content Type Options' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Content type Options = no sniff'
  desc 'All responses should contain X-Content-Type-Options=nosniff'
  tag 'ASVS-14.4.4'
  tag 'ISO27001-14.1.2'
  describe http('http://192.168.0.6:3000') do                  # The actual test
    its('headers.x-content-type-options') { should cmp 'nosniff' } 
  end
end

control 'HTTP Headers - X-Frame Options or CSP' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'X Frame Options or Content Security policy set'             # A human-readable title
  desc 'All responses should include X Frame Options or Content Security Policy'
  tag 'ASVS-14.4.7'
  tag 'ISO27001-14.1.2'
  describe http('http://192.168.0.6:3000').headers do                  # The actual test
    its('x-frame-options') { should cmp 'SAMEORIGIN' }
  end
  tag 'ASVS-14.4.7'
end


control 'HTTP Header - Content type' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Safe character set'             # A human-readable title
  desc 'HTTP response contains content type header with safe character set'
  tag 'ASVS-14.4.1'
  tag 'ISO27001-14.1.2'
  describe http('http://192.168.0.6:3000') do                  # The actual test
    its('headers.Content-type') { should cmp 'text/html; charset=utf-8' }
  end
end
