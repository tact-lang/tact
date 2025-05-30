struct A {
  x: Int;
  y: Int;
  z: Int;
}

contract DefaultVals {
  a: A = A{ x: 1, y: 2, z: 3 };

  init() {
    self.a = A{ x: 4, y: 5, z: 6 };
  }
}