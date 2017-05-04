module Stattleship
  class Officials < Stattleship::Endpoint
    include Factory::ClassFactory

    class << self
      attr_accessor :endpoint

      def fetch(params:)
        super(
          path:   self.endpoint,
          params: params
        )
      end
    end

    def populate
      seasons.each do |season|
        populate_league(season)
      end
    end

    define_class prefix: 'Football' do
      self.endpoint = 'football/nfl/officials'
    end

    define_class prefix: 'Basketball' do
      self.endpoint = 'basketball/nba/officials'
    end

    define_class prefix: 'Hockey' do
      self.endpoint = 'hockey/nhl/officials'
    end

    define_class prefix: 'Baseball' do
      self.endpoint = 'baseball/mlb/officials'
    end
  end

  module SeasonsRepresenter
    include Factory::ModuleFactory
    include Roar::JSON
    include Stattleship::Models

    collection :leagues, extend: LeagueRepresenter,
                          class: League

    collection :officials, extend: OfficialRepresenter,
                            class: Official

    define_module prefix: 'Football',   modules: [Roar::JSON]
    define_module prefix: 'Basketball', modules: [Roar::JSON]
    define_module prefix: 'Hockey',     modules: [Roar::JSON]
    define_module prefix: 'Baseball',   modules: [Roar::JSON]
  end
end
