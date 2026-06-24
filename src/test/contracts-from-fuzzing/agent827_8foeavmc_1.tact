struct SimpleNested {
  x: Int;
  y: Int?;
}

contract TestContract {
  data: SimpleNested;

  init() {
    self.data = SimpleNested{
      x: 10,
      y: null
    };
  }
}