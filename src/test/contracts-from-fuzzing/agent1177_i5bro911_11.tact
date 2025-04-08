struct MultiNest {
  a: Int;
  b: Inner;
}

struct Inner {
  c: Int;
  d: Bool;
  e: Innermost;
}

struct Innermost {
  z: String;
}

contract MultiNested {
  x: MultiNest;

  init() {
    self.x = MultiNest{
      a: 11,
      b: Inner{ c: 22, d: true, e: Innermost{ z: "x" } }
    };
  }
}
