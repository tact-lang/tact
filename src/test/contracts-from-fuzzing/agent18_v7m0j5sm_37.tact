struct Inner {
  x: Int;
}

contract RepeatFields {
  f1: Inner;
  f2: Inner;
  f3: Inner;

  init() {
    self.f1 = Inner{ x:1 };
    self.f2 = Inner{ x:2 };
    self.f3 = Inner{ x:3 };
  }
}