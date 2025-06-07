struct SimpleNested {
  x: Int;
  y: Int;
}

contract TestContract {
  point: SimpleNested;

  init() {
    self.point = SimpleNested{ x: 1, y: 2 };
  }
}