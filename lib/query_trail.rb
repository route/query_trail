ActiveSupport.on_load :active_record do
  if Object.const_defined?('Rails::Server')
    require 'query_trail/log_subscriber'
    QueryTrail::LogSubscriber.attach_to(:active_record)
  end
end
