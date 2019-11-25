# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/platform/2-8/stemcells/(?![\d-]+)(.*)}, "/platform/stemcells/$1"
r301 %r{/platform/2-7/stemcells/(?![\d-]+)(.*)}, "/platform/stemcells/$1"
r301 %r{/pivotalcf/2-6/stemcells/(?![\d-]+)(.*)}, "/platform/stemcells/$1"
