struct X {
  x1: Int;
}

struct Y {
  y1: Int;
}

contract OptionalStructFields {
  optX: X?;
  optY: Y?;

  init() {
    self.optX = null;
    self.optY = null;
  }
}
