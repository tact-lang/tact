struct Big {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
}

contract BigNested {
  value: Big;

  init() {
    self.value = Big{
      a: 1,
      b: true,
      c: "hi",
      d: null,
      e: false,
      f: null,
      g: 7,
      h: false,
      i: "bye",
    };
  }
}