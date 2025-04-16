struct L {
  a: Int?;
  b: Bool?;
  s: String?;
}

struct M {
  x: Int;
  y: Int?;
  left: L;
  right: L?;
}

contract Test {
  val: M;

  init() {
    self.val = M{
      x: 1,
      y: null,
      left: L{ a: null, b: true, s: "" },
      right: L{ a: 2, b: null, s: null }
    };
  }

  receive() {}
}