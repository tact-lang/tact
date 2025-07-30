struct Inner {
  val: Int;
}

struct Outer {
  nested: Inner;
}

contract TestContract {
  outer: Outer;

  init() {
    self.outer = Outer{nested: Inner{val: 10}};
  }
}