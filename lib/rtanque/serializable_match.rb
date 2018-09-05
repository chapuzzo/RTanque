require 'json'

module RTanque
  class SerializableMatch < BasicObject

    def initialize match, output_file, interval
      @match = match
      @output_file = output_file
      @interval = interval
      @snapshots = []
      Bot.include(Serializable::Bot) unless Bot.include? Serializable::Bot
      Shell.include(Serializable::Shell) unless Shell.include? Serializable::Shell
      Explosion.include(Serializable::Explosion) unless Explosion.include? Serializable::Explosion
      Match.include(Serializable::Match) unless Match.include? Serializable::Match
    end

    def method_missing(m, *args, &block)
      @match.send(m, *args, &block)
    end

    def tick
      @match.tick
      at_tick_interval(@interval) {
        @snapshots << snapshot
      }
    end

    def serialized_match
      {
        arena: @match.arena.to_h,
        ticks: @match.ticks,
        snapshots: @snapshots
      }
    end

    def start
      tick until self.finished?
      ::File.open(@output_file, "w") { |file|
        file.write serialized_match.to_json(
          indent: " ",
          object_nl: "\n",
          array_nl: "\n",
          space: ' '
        )
      }
    end

    def snapshot
      {
        tick: ticks,
        scene: to_h
      }
    end

    private
        def at_tick_interval(num_of_ticks)
          yield if @match.ticks % num_of_ticks == 0
        end
  end
end
