struct RecA {
  x: Int;
}

struct RecB {
  a: RecA;
}

struct RecC {
  b: RecB;
}

contract ManyLayers {
  layer: RecC;

  init() {
    self.layer = RecC{ b: RecB{ a: RecA{ x: 1 } } };
  }
}