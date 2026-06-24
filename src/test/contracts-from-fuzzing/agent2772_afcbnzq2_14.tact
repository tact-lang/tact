struct OptionalsMix {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int;
  e: String;
}

contract TestOptionalsMix {
  data: OptionalsMix;

  init() {
    self.data = OptionalsMix{
      a: null,
      b: null,
      c: null,
      d: 1,
      e: "test"
    };
  }
}
