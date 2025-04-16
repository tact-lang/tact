struct Inner {
  flag: Bool;
  amount: Int;
}

struct Outer {
  inner: Inner;
  status: Bool;
}

contract DeepNestedTest {
  storage: Outer;

  init() {
    self.storage = Outer{
      inner: Inner{flag: true, amount: 7},
      status: false
    };
  }
}