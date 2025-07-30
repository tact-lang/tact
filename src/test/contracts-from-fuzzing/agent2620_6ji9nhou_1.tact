struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  optInner: Inner?;
  x: Int;
}

contract NestedOptionalsTest {
  data: Outer;

  init() {
    self.data = Outer{
      optInner: null,
      x: 42
    };
  }
}
