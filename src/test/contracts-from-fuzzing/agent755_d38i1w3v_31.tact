struct Extreme {
  x: Int as uint1;
  y: Int as int257;
}

contract ExtremeWidths {
  data: Extreme;

  init() {
    self.data = Extreme { x:1, y:-1 };
  }
}