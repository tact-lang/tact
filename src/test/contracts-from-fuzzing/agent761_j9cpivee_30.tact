struct P {
  x:Int;
  y:Int;
}
contract ArraySim {
  p0:P; p1:P; p2:P; p3:P;
  init() {
    self.p0 = P{ x: 1, y:2 };
    self.p1 = P{ x: 3, y:4 };
    self.p2 = P{ x: 5, y:6 };
    self.p3 = P{ x: 7, y:8 };
  }
}