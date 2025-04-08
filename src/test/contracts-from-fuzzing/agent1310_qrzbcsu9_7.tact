struct BoolNest {
  a: Bool;
  b: Bool?;
  c: Bool;
  d: Bool?;
}

contract BoolNestContract {
  s: BoolNest;
  init() {
    self.s = BoolNest{
      a: true,
      b: null,
      c: false,
      d: null
    };
  }
}