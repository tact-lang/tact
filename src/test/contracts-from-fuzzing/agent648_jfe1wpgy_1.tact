struct Inner {
  val: Int;
  flag: Bool;
}

struct Outer {
  nested: Inner;
  count: Int;
}

contract TestContract {
  data: Outer;
  init() {
    self.data = Outer{nested: Inner{val: 1, flag: true}, count: 42};
  }
}
