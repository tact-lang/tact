struct BigNested {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
}

contract BigFields {
  data: BigNested;

  init() {
    self.data = BigNested {
      a: 1, b: true, c: 2, d: false,
      e: 3, f: false, g: null, h: null
    };
  }
}