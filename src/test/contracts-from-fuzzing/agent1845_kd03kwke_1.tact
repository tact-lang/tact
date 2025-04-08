struct NestedStruct {
  x: Int;
  y: Int;
}

struct OuterStruct {
  a: NestedStruct;
  b: Int;
}

contract TestNestedStruct {
  s: OuterStruct;

  init() {
    self.s = OuterStruct{
      a: NestedStruct{ x: 1, y: 2 },
      b: 3,
    };
  }
}
