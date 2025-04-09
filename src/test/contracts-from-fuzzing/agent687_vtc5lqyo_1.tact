struct NestedInner {
  x: Int;
  y: Int?;
}

struct NestedOuter {
  a: Bool;
  b: NestedInner;
  c: NestedInner?;
}

contract DeepPersistentTest {
  data: NestedOuter;

  init() {
    self.data = NestedOuter{
      a: true,
      b: NestedInner{ x: 1, y: null },
      c: null
    };
  }
}