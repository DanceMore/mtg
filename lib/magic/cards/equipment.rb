module Magic
  module Cards
    class Equipment < Attachment
      TYPE_LINE = "Artifact -- Equipment"

      def self.equip(equip_cost)
        equip = Class.new(ActivatedAbility) do
          define_method(:costs) { equip_cost }

          def target_choices
            game.battlefield.creatures.controlled_by(controller)
          end

          def resolve!(target:)
            target.attachments << source
          end
        end

        define_method(:activated_abilities) do
          [equip]
        end
      end
    end
  end
end
