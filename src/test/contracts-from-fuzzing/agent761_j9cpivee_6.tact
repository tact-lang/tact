struct Many {
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

contract LargeStructFields {
  data: Many;

  init() {
    self.data = Many{
      a: 1,
      b: true,
      c: "x",
      d: null,
      e: false,
      f: "hi",
      g: 2,
      h: false,
      i: "bye",
    };
  }
}