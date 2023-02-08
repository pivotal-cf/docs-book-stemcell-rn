# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/stemcells/(2-[3-9]|2-\d\d+)/(.*)}, '/stemcells/$2'

# Redirect from docs.pivotal.io/stemcells to docs.vmware.com Stemcell release notes docs
r301  %r{/stemcells/([\w-]*\.html)}, "https://docs.vmware.com/en/Stemcells-for-VMware-Tanzu/services/release-notes/$1"
r301  %r{/stemcells/}, "https://docs.vmware.com/en/Stemcells-for-VMware-Tanzu/services/release-notes/index.html"
r301  %r{/stemcells}, "https://docs.vmware.com/en/Stemcells-for-VMware-Tanzu/services/release-notes/index.html"
