struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: String?;
  f: Bool?;
  g: Int;
  h: String;
  i: Bool;
  j: Int;
}

contract Test {
  store: ManyFields;

  init() {
    self.store = ManyFields{
      a: 1,
      b: false,
      c: "x",
      d: null,
      e: null,
      f: null,
      g: 2,
      h: "y",
      i: true,
      j: 3
    };
  }
}