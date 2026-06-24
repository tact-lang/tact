struct Inner {
  x: Int;
}

struct Outer {
  nested: Inner;
}

contract Test {
  val: Outer;
  init() {
    self.val = Outer{nested: Inner{x: 123}};
  }
}