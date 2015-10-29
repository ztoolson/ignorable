$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ignore_columns'
require 'active_record'

puts "Testing against ActiveRecord #{ActiveRecord::VERSION::STRING}"

ActiveRecord::Base.establish_connection("adapter" => "sqlite3", "database" => ":memory:")
