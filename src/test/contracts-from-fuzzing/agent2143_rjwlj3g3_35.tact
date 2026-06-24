struct NestedOptionalInner {
  foo: Int?;
}

struct NestedOptionalOuter {
  bar: NestedOptionalInner?;
}

contract NestedOptionalStructs {
  data: NestedOptionalOuter;

  init() {
    self.data = NestedOptionalOuter{bar: null};
  }
}