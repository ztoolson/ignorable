Gem::Specification.new do |s|
  s.name        = "zt-ignorable"
  s.version     = "0.3.2"
  s.authors     = ["Nathaniel Jones", "Mando Escamilla", "Zach Toolson"]
  s.email       = ["nj@third.io", "", "zach.toolson@gmail.com"]
  s.homepage    = "http://github.com/ztoolson/ignorable"
  s.summary     = "Ignore columns in ActiveRecord models"
  s.description = "Ignore problematic column names (like 'attributes' or 'class') in ActiveRecord models for legacy database schemas"
  s.add_runtime_dependency("activerecord", ">= 3")
  s.files        = Dir.glob("{lib}/**/*") + %w(README.md)
  s.license      = "MIT"
end
