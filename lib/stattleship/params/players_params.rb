module Stattleship
  module Params
    class PlayersParams < Stattleship::Params::QueryParams
      attr_accessor :team_id

      def params
        super.merge('team_id' => team_id)
      end
    end
  end
end
