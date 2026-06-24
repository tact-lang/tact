struct NestedOptional {
  optInner: Inner?;
}

struct Inner {
  x: Int;
  y: Bool?;
}

contract NestedOptionalField {
  n: NestedOptional;
  init() {
    self.n = NestedOptional{optInner: null};
  }
}