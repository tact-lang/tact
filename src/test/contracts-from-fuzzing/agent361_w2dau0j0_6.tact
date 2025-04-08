struct StructA {
  x: Int;
}

struct StructB {
  y: Bool;
}

struct StructC {
  a: StructA;
  b: StructB;
}

contract CombinedStructFields {
  data: StructC;

  init() {
    self.data = StructC{
      a: StructA{ x: 42 },
      b: StructB{ y: true },
    };
  }
}
