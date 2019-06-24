module Grape
  module Attack
    module Extension

      def throttle(options = {})
        route_setting(:throttle, options)
        options
      end

      ::Grape::API::Instance.extend self

    end
  end
end
