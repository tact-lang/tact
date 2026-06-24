struct DeepOptionals {
  one: Int?;
  two: String?;
  three: Bool?;
}

struct HasDeepOptional {
  nested: DeepOptionals?;
}

contract OptionalChain {
  val: HasDeepOptional;

  init() {
    self.val = HasDeepOptional{ nested: null };
  }
}