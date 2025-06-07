struct Inner {
  flag: Bool?;
}

struct Outer {
  inner: Inner;
  count: Int;
}

contract DeepNestedTest {
  state: Outer = Outer{
    inner: Inner{ flag: null },
    count: 0,
  };

  init() {
    self.state = Outer{
      inner: Inner{ flag: true },
      count: 42,
    };
  }
}
