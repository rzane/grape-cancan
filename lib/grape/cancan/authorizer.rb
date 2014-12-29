module Grape
  module CanCan
    module Authorizer
      # Convienience method to authorize every route
      def authorize_routes!
        before { authorize_route! }
      end
    end
  end
end
