struct InnerMost {
  a: Int?;
  b: Bool?;
}

struct MiddleOpt {
  x: InnerMost?;
  y: Int;
}

contract DeepNestedOptionals {
  value: MiddleOpt?;

  init() {
    self.value = null;
  }
}
