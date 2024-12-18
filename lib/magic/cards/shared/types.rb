module Magic
  module Cards
    module Shared
      module Types
        def self.included(base)
          base.class_eval do
            class << self
              def set_types(*types)
                const_set(:TYPE_LINE, types)
              end

              def types
                const_get(:TYPE_LINE)
              end

              def creature_types(types)
                types.split(/(?<!Time) (?!Lord)/).map { T::Creatures[_1] }
              end

              def creature_type(types)
                type(T::Creature, *creature_types(types))
              end

              def artifact_creature_type(types)
                set_types(T::Artifact, T::Creature, *creature_types(types))
              end

              def enchantment_creature_type(types)
                set_types(T::Enchantment, T::Creature, *creature_types(types))
              end

              def legendary_creature_type(types)
                set_types(T::Super::Legendary, T::Creature, *creature_types(types))
              end

              def planeswalker(name)
                set_types(T::Super::Legendary, T::Planeswalker, name)
              end

              def type(*types)
                set_types(*types)
              end
            end
          end
        end
      end
    end
  end
end
