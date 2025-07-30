struct DeepNested {
  a: Int;
  b: Int?;
}

struct MiddleLvl {
  x: Int;
  y: DeepNested;
  z: DeepNested?;
}

contract NestedStructFields {
  main: MiddleLvl;
  optionalMain: MiddleLvl?;

  init() {
    self.main = MiddleLvl{
      x: 10,
      y: DeepNested{ a: 1, b: null },
      z: null,
    };
    self.optionalMain = null;
  }
}
