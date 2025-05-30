struct Struct1 {
  a: Int;
}

struct Struct2 {
  b: Int;
}

contract ManyStructVars {
  x: Struct1;
  y: Struct2;
  z: Struct1;
  w: Struct2;

  init() {
    self.x = Struct1 { a: 10 };
    self.y = Struct2 { b: 20 };
    self.z = Struct1 { a: 30 };
    self.w = Struct2 { b: 40 };
  }
}