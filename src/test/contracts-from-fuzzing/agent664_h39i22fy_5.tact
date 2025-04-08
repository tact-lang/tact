struct BigMixed {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Bool?;
  g: Int;
  h: String;
  i: Bool;
}

contract Test {
  store: BigMixed;

  init() {
    self.store = BigMixed{
      a: 1,
      b: "foo",
      c: true,
      d: null,
      e: "bar",
      f: false,
      g: 2,
      h: "baz",
      i: true,
    };
  }
}