struct Complex {
  x: Int?;
  y: Bool;
  z: String;
}

contract MultipleComplexFields {
  c1: Complex;
  c2: Complex;
  c3: Complex;

  init() {
    self.c1 = Complex{ x: null, y: false, z: "first" };
    self.c2 = Complex{ x: 2, y: true, z: "second" };
    self.c3 = Complex{ x: null, y: true, z: "third" };
  }
}