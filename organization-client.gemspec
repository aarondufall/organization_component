# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'organization-client'
  s.version = '0.0.0'
  s.summary = 'Organization Client'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-examples/organization-component'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  s.require_paths = ['lib']

  files = Dir["lib/organization/**/*.rb"]

  files += Dir["lib/organization_component/{controls.rb,controls/**/*.rb}"]

  files << "lib/organization_component/load.rb"

  File.read("lib/organization_component/load.rb").each_line.map do |line|
    next if line == "\n"

    _, filename = line.split(/[[:blank:]]+/, 2)

    filename.gsub!(/['"]/, '')
    filename.strip!

    filename = File.join('lib', "#{filename}.rb")

    if File.exist?(filename)
      files << filename
    end
  end

  s.files = files

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  s.add_runtime_dependency 'evt-messaging-postgres'
  s.add_runtime_dependency 'evt-configure'

  s.add_development_dependency 'test_bench'
end
