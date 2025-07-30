struct Big {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
  g: String;
  h: String;
  i: Int;
  j: Bool;
  k: Int?;
}

contract Test {
  storage: Big;

  init() {
    self.storage = Big{
      a: 1,
      b: false,
      c: "abc",
      d: null,
      e: null,
      f: "f",
      g: "g",
      h: "h",
      i: 42,
      j: true,
      k: null
    };
  }
}