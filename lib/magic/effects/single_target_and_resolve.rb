module Magic
  module Effects
    class SingleTargetAndResolve < TargetedEffect
      attr_reader :choices, :resolution

      def initialize(**args)
        @resolution = resolution
        super(**args)
      end

      def resolve(...)
        resolution.call(...)
      end
    end
  end
end
