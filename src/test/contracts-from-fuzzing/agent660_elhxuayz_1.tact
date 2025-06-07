struct Inner {
  x: Int;
  y: Int;
}

struct Outer {
  inner: Inner;
  z: Int;
}

contract NestedStructsTest {
  storage: Outer;

  init() {
    self.storage = Outer{
      inner: Inner{ x: 1, y: 2 },
      z: 3,
    };
  }
}