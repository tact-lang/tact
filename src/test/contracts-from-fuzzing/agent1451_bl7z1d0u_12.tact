struct OptionalBools {
  a: Bool?;
  b: Bool?;
  c: Bool?;
}

contract OptBoolFields {
  opts: OptionalBools;

  init() {
    self.opts = OptionalBools{
      a: null,
      b: true,
      c: false
    };
  }
}
