struct Inner {
  x: Int;
  y: Int?;
}

contract DeepNestedTest {
  point: Inner;
  optPoint: Inner?;

  init() {
    self.point = Inner{ x: 1, y: null };
    self.optPoint = null;
  }
}