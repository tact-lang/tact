struct StructA {
  x: Int;
}

struct StructB {
  y: Bool;
}

contract MultiStructs {
  a: StructA;
  b: StructB;

  init() {
    self.a = StructA{ x:1 };
    self.b = StructB{ y:true };
  }
}