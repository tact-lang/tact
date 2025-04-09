struct StructA {
  valA: Int;
}

struct StructB {
  valB: Int;
}

struct StructC {
  valC: Int;
}

contract ManyStructs {
  a: StructA;
  b: StructB;
  c: StructC;

  init() {
    self.a = StructA{ valA: 1 };
    self.b = StructB{ valB: 2 };
    self.c = StructC{ valC: 3 };
  }
}