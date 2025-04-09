struct Wrap {
  x: Int;
}

contract ManyWraps {
  w1: Wrap;
  w2: Wrap;
  w3: Wrap;
  w4: Wrap;
  w5: Wrap;

  init() {
    self.w1 = Wrap{ x:1 };
    self.w2 = Wrap{ x:2 };
    self.w3 = Wrap{ x:3 };
    self.w4 = Wrap{ x:4 };
    self.w5 = Wrap{ x:5 };
  }
}