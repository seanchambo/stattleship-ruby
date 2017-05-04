module Stattleship
  module Models
    class Season < OpenStruct
      def league_name
        league.name
      end

      def league_abbreviation
        league.abbreviation
      end
    end

    module SeasonRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      property :ends_on, type: Date
      property :id
      property :league_id
      property :name
      property :slug
      property :starts_on, type: Date
    end
  end
end
