module Magic
  module Cards
    class LoxodonWayfarer < Creature
      COST = { any: 2, white: 1 }
      POWER = 1
      TOUGHNESS = 5

      def initialize(**args)
        super(name: "Loxodon Wayfarer", type_line: "Creature -- Elephant Monk", **args)
      end
    end
  end
end
