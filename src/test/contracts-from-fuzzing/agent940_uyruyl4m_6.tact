struct Inner {
  a: Int?;
  b: Bool;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
}

contract DoubleOptionalNested {
  val: Outer;

  init() {
    self.val = Outer{
      inner1: Inner{ a: null, b: true },
      inner2: Inner{ a: 5, b: false }
    };
  }
}
