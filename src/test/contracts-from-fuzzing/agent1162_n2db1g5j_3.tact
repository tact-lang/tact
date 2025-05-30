struct S1 {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
}

contract OptionalFields {
  s: S1;

  init() {
    self.s = S1{
      a: 5,
      b: false,
      c: null,
      d: null,
    };
  }
}