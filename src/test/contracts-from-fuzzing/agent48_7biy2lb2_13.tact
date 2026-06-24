struct Inner {
  x: Int?;
  y: Int;
}

contract TestContract {
  f1: Inner;
  f2: Int;
  f3: Inner;

  init() {
    self.f1 = Inner{ x: null, y: 1 };
    self.f2 = 2;
    self.f3 = Inner{ x: 3, y: 4 };
  }
}