struct StructA {
  x: Int;
}

struct StructB {
  y: Int;
  sa: StructA;
}

struct StructC {
  z: Int;
  sb: StructB;
}

contract CombineNested {
  cval: StructC;
  init() {
    self.cval = StructC{
      z: 9,
      sb: StructB{
        y: 8,
        sa: StructA{ x: 7 }
      }
    };
  }
}