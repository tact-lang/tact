struct OneField {
  value: Int;
}

struct TwoField {
  a: Int;
  b: Int;
}

struct ThreeField {
  x: Int;
  y: Int;
  z: Int;
}

contract TestContract {
  field1: OneField;
  field2: TwoField;
  field3: ThreeField;
  init() {
    self.field1 = OneField{ value: 1 };
    self.field2 = TwoField{ a: 2, b: 3 };
    self.field3 = ThreeField{ x: 4, y: 5, z: 6 };
  }
}
