struct Flat {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: String?;
  f: Bool?;
  g: Int;
  h: String;
  i: Bool;
}

contract ManyFields {
  s: Flat;

  init() {
    self.s = Flat{
      a: 1,
      b: false,
      c: "hi",
      d: null,
      e: null,
      f: null,
      g: 2,
      h: "bye",
      i: true
    };
  }
}