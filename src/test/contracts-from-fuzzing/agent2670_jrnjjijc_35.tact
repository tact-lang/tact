struct OptionalInnerInner {
  x: Int?;
}

struct NestedOptionals {
  nested: OptionalInnerInner?;
}

contract SuperNestedOptionals {
  f: NestedOptionals;

  init() {
    self.f = NestedOptionals{ nested: null };
  }
}