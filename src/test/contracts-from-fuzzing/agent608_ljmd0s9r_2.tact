struct Inner {
  x: Int;
  y: Bool;
}

struct Outer {
  inner: Inner;
  z: Int;
}

contract DoubleNestedTest {
  st: Outer;
  
  init() {
    self.st = Outer{inner: Inner{x: 7, y: false}, z: 42};
  }
}
