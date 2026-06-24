struct D {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
}

contract Test {
  d: D;

  init() {
    self.d = D{
      a: 1,
      b: null,
      c: 3,
      d: 4
    };
  }
}