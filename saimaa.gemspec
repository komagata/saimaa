# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{saimaa}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Masaki Komagata"]
  s.date = %q{2009-08-17}
  s.default_executable = %q{saimaa}
  s.description = %q{An easy Continuous Integration Toolkit.}
  s.email = %q{komagata@gmail.com}
  s.executables = ["saimaa"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "bin/saimaa",
     "lib/saimaa.rb",
     "test/saimaa_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/komagata/saimaa}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{An easy Continuous Integration Toolkit.}
  s.test_files = [
    "test/saimaa_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<systemu>, [">= 1.2.0"])
    else
      s.add_dependency(%q<systemu>, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<systemu>, [">= 1.2.0"])
  end
end
