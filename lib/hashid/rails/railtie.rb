module Hashid
  module Rails
    class Railtie < ::Rails::Railtie #:nodoc:
      config.after_initialize do
        using_model = Hashid::Rails.configuration.using_model
        using_model == :all && ActiveRecord::Base.hashid
      end
    end
  end
end
