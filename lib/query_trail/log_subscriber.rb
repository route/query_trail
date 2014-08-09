module QueryTrail
  class LogSubscriber < ActiveSupport::LogSubscriber
    HEADER = "  \e[1m\e[34mQuery Trail:\e[0m "
    IGNORE_PAYLOAD_NAMES = ActiveRecord::LogSubscriber::IGNORE_PAYLOAD_NAMES

    def sql(event)
      return unless logger.debug?
      payload = event.payload
      return if IGNORE_PAYLOAD_NAMES.include?(payload[:name])

      if backtrace = backtrace_cleaner.clean(caller).presence
        logger.debug HEADER + backtrace.shift
        logger.debug backtrace.map { |line| ' ' * (HEADER.size - 13) + line }.join("\n")
      end
    end

    private

    def logger
      ActiveRecord::Base.logger
    end

    def backtrace_cleaner
      @backtrace_cleaner ||= begin
        backtrace_cleaner = Rails::BacktraceCleaner.new
        backtrace_cleaner.add_filter { |line| line.sub(/(app\/views.*:\d+):in.*/, '\1') }
        backtrace_cleaner
      end
    end
  end
end
