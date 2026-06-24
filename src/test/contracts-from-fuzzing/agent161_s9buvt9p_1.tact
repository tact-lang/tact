struct NestedInner {
  z: Int;
}

struct NestedOuter {
  x: Int;
  y: NestedInner;
}

contract DeepNestedTest {
  nested: NestedOuter;

  init() {
    self.nested = NestedOuter{
      x: 1,
      y: NestedInner{z: 2}
    };
  }
}