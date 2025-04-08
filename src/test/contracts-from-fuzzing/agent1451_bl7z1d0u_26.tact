struct OptionalIntBool {
  x: Int?;
  y: Bool?;
}

contract OptIntBool {
  pair: OptionalIntBool;

  init() {
    self.pair = OptionalIntBool{
      x: 42,
      y: null
    };
  }
}
