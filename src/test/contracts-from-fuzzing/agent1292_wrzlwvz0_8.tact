struct OptionalBig {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Bool?;
  e: Int?;
  f: Bool?;
}

contract OptionalContract {
  stored: OptionalBig;

  init() {
    self.stored = OptionalBig {
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null
    };
  }
}