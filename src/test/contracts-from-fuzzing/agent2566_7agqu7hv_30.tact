struct IntOptionInner {
  a: Int?;
}

struct IntOptionOuter {
  inner: IntOptionInner?;
  b: Int;
}

contract NestedOptionals {
  data: IntOptionOuter;

  init() {
    self.data = IntOptionOuter{inner: null, b: 5};
  }
}
