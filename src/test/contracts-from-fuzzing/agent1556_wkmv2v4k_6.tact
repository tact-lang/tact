struct StructA {
  alpha: Int;
}

struct StructB {
  beta: Int?;
}

struct StructC {
  gamma: Bool;
}

contract MultiStructs {
  a: StructA;
  b: StructB;
  c: StructC;

  init() {
    self.a = StructA{ alpha: 0 };
    self.b = StructB{ beta: null };
    self.c = StructC{ gamma: true };
  }
}
