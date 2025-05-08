struct Inner {
  flag: Bool;
  count: Int?;
}

struct Outer {
  inner: Inner;
  amount: Int;
}

contract NestedOptionalTest {
  field: Outer;

  init() {
    self.field = Outer {
      inner: Inner { flag: false, count: null },
      amount: 55
    };
  }
}