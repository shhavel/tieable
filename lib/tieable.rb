require "tieable/version"

module Tieable
  def tie(*args, &block)
    if args.size > 0
      if args.first.nil?
        self
      else
        self.public_send(*args, &block)
      end
    elsif block_given?
      yield(self) || self
    else
      raise ArgumentError, "#{self.class}#tie method requires any arguments or block"
    end
  end
end

class Object
  include Tieable
end
