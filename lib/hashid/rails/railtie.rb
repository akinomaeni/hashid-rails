module Hashid
  module Rails
    class Railtie < ::Rails::Railtie #:nodoc:
      config.after_initialize do
        use_on_all_model = Hashid::Rails.configuration.use_on_all_model
        use_on_all_model && ActiveRecord::Base.hashid
      end
    end
  end
end
