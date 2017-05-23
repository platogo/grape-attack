module Grape
  module Attack
    class Configuration
      class Global
        attr_accessor :redis, :header_info

        def initialize
          @header_info = false
        end
      end

      class << self
        def global
          if block_given?
            yield global_config
          else
            global_config
          end
        end

        private

        def global_config
          @global_config ||= Global.new
        end
      end

      attr_accessor :adapter, :disable

      def initialize
        @adapter = ::Grape::Attack::Adapters::Redis.new
        @disable = Proc.new { false }
      end
    end
  end
end
