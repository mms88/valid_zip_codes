Gem::Specification.new do |s|
  s.name        = 'valid_zip_codes'
  s.version     = '0.0.1'
  s.date        = '2015-02-01'
  s.summary     = "Validate zip codes and get city names"
  s.description = "Gem to validate zip codes and get city names. Currently only for denmark."
  s.authors     = ["Mathias Salomonsson"]
  s.email       = 'mathias@salomonsson.dk'

  
  s.files       = [
                    "lib/valid_zip_codes.rb",
                    "zips/DK.yml",
                    "zips/SE.yml",
                    "spec/valid_zip_codes_spec.rb"
                  ]

  s.require_path = "lib"
  s.required_ruby_version = '>= 2.0.0'
  s.required_rubygems_version = ">= 1.3.6"
  s.test_files = Dir[ "spec/*_spec.rb" ]

  s.license       = 'MIT'
end