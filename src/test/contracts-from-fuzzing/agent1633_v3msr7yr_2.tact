struct Inner {
  a: Int;
  b: String;
  c: Bool;
}

struct Middle {
  m1: Inner;
  m2: Inner;
}

contract DeepNestedTest {
  val: Middle;

  init() {
    self.val = Middle{
      m1: Inner{ a: 1, b: "x", c: true },
      m2: Inner{ a: 2, b: "y", c: false }
    };
  }
}