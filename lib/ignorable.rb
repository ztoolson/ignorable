require 'set'
require 'active_record'
require 'active_support/core_ext/class/attribute'

module Ignorable
  module InstanceMethods
    def attributes # :nodoc:
      super.reject{|col, _val| self.class.ignored_column?(col)}
    end

    def attribute_names # :nodoc:
      super.reject{|col| self.class.ignored_column?(col)}
    end
  end

  module ClassMethods
    def columns # :nodoc:
      @columns ||= super.reject{ |col| ignored_column?(col.name)}
    end

    def ignored_columns
      @ignored_columns ||= ::Set.new
    end

    # Prevent Rails from loading a table column.
    # Useful for legacy database schemas with problematic column names,
    # like 'class' or 'attributes'.
    #
    #   class Topic < ActiveRecord::Base
    #     ignore_columns :attributes, :class
    #   end
    #
    #   Topic.new.respond_to?(:attributes) => false
    def ignore_columns(*columns)
      columns.each do |column|
        self.ignored_columns << "#{column}"
      end

      reset_column_information
      descendants.each(&:reset_column_information)
      self.ignored_columns.to_a
    end
    alias ignore_column ignore_columns

    # Has a column been ignored?
    # Accepts column names
    def ignored_column?(column)
      self.ignored_columns.include?(column.to_s)
    end

    def reset_ignored_columns
      self.ignored_columns = ::Set.new
      reset_column_information
    end
  end
end

unless ActiveRecord::Base.include?(Ignorable::InstanceMethods)
  ActiveRecord::Base.send :include, Ignorable::InstanceMethods
  ActiveRecord::Base.send :extend, Ignorable::ClassMethods
end
