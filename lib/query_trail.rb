ActiveSupport.on_load :active_record do
  unless Object.const_defined?('Rails::Console')
    require 'query_trail/log_subscriber'
    QueryTrail::LogSubscriber.attach_to(:active_record)
  end
end
