module Magic
  module Zones
    class Battlefield < Zone
      extend Forwardable

      def_delegators :permanents, :creatures

      def initialize(**args)
        super(**args)
      end

      def battlefield?
        true
      end

      def add(permanent)
        super(permanent)
      end

      def static_abilities
        StaticAbilities.new(@cards.flat_map(&:static_abilities))
      end

      def permanents
        cards.permanents
      end

      def receive_event(event)
        case event
        when Events::EnteredZone
          if event.to == :battlefield
            add(event.card)
          end

        when Events::LeavingZone
          if event.from == :battlefield
            remove(event.card)
          end
        end
        permanents.each { |permanent| permanent.receive_notification(event) }
      end

      def cleanup
        creatures.each(&:cleanup!)
      end
    end
  end
end
