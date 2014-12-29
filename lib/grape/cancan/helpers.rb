module Grape
  module CanCan
    module Helpers
      delegate :can?, :cannot?, :authorize!, to: :current_ability

      # Returns an instance of the CanCan ability
      def current_ability
        @current_ability ||= ::Ability.new(current_user)
      end

      # Call authorize using the :authorize key on the route
      def authorize_route!
        opts = env['api.endpoint'].options[:route_options]
        return unless opts.key?(:authorize)
        authorize!(*opts[:authorize])
      end
    end
  end
end
