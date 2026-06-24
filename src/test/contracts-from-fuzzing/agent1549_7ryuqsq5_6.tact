struct X {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
}

contract Test {
  value: X;
  init() {
    self.value = X{
      a: 1,
      b: true,
      c: null,
      d: null,
      e: "hi",
      f: null
    };
  }
}