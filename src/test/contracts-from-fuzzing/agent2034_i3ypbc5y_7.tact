struct SOpt {
  s: Int?;
}

contract MultiOption {
  s1: SOpt?;
  s2: SOpt?;

  init() {
    self.s1 = null;
    self.s2 = SOpt{ s: 42 };
  }
}