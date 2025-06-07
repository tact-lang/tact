struct Combo {
  a: Int;
  b: Bool?;
  c: String;
  d: Bool;
  e: String?;
}

contract Test {
  item: Combo;

  init() {
    self.item = Combo{
      a: 11,
      b: null,
      c: "foo",
      d: true,
      e: null,
    };
  }
}