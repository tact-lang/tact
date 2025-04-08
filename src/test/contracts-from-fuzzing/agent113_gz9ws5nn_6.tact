struct OptionalDeepNest {
  wrapped: DeepOptional?;
}

struct DeepOptional {
  x: InnerOptional?;
}

struct InnerOptional {
  value: Int;
}

contract TestOptionalDeepNest {
  optField: OptionalDeepNest;

  init() {
    self.optField = OptionalDeepNest{ wrapped: null };
  }
}