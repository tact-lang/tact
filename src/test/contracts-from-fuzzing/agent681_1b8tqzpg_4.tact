struct FlatMany {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: String;
  f: Int;
  g: String;
  h: Bool;
  i: String;
  j: Int;
}

contract WideFields {
  obj: FlatMany;

  init() {
    self.obj = FlatMany{
      a: 1,
      b: true,
      c: 2,
      d: false,
      e: "a",
      f: 3,
      g: "b",
      h: true,
      i: "c",
      j: 4
    };
  }
}