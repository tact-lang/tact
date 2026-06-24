struct AB {
  a: Int;
  b: Int;
}

contract ManyVariables {
  x: Int;
  y: AB;
  z: Int?;

  init() {
    self.x = 1;
    self.y = AB{ a: 2, b: 3 };
    self.z = null;
  }
}