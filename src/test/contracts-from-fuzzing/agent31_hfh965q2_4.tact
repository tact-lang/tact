struct S {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
}

contract Test {
  s: S;

  init() {
    self.s = S{
      a: 1,
      b: "hello",
      c: false,
      d: null
    };
  }
}