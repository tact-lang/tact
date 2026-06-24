struct SimpleOpt {
  i: Int?;
  b: Bool?;
}

contract Test {
  f1: SimpleOpt?;
  f2: SimpleOpt;

  init() {
    self.f1 = SimpleOpt{ i: null, b: null };
    self.f2 = SimpleOpt{ i: 7, b: true };
  }
}