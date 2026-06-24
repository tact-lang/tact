struct Deep {
  x: Int;
  y: Int?;
  z: Int;
}

contract OptMix {
  d1: Deep;
  d2: Deep;

  init() {
    self.d1 = Deep{ x: 1, y: null, z:3 };
    self.d2 = Deep{ x: 4, y: null, z:6 };
  }
}