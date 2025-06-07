struct Inner {
  a: Int?;
  b: Bool?;
}

struct Outer {
  x: Inner;
  y: Int?;
}

contract NestedOptionalFields {
  val: Outer;

  init() {
    self.val = Outer {
      x: Inner { a: null, b: true },
      y: null
    };
  }
}