struct DoubleNested {
  a: Int;
  b: Int?;
}

struct Top {
  x: DoubleNested;
  y: DoubleNested?;
}

contract TwoLevelsOptional {
  data: Top;
  init() {
    self.data = Top {
      x: DoubleNested { a: 1, b: null },
      y: null
    };
  }
}