// Struct with large number of optionals alternating non-optional fields
struct Combo {
  a: Int?;
  b: Int;
  c: Int?;
  d: String;
  e: Bool?;
  f: Int;
  g: Bool?;
  h: String;
}

contract OptNonOpt {
  field: Combo;

  init() {
    self.field = Combo{
      a: null,
      b: 2,
      c: null,
      d: "x",
      e: true,
      f: 6,
      g: null,
      h: "y",
    };
  }
}
