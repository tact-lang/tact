struct NestedMultiOpt {
  a: Int?;
  b: Bool?;
}

struct MiddleLevel {
  x: NestedMultiOpt?;
  y: String?;
}

contract MultiOptional {
  m: MiddleLevel;
  init() {
    self.m = MiddleLevel {
      x: null,
      y: null
    };
  }
}
