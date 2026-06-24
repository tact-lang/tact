struct NestedStructB {
  z: Bool;
}

struct NestedStructA {
  y: Int;
  nested: NestedStructB;
}

contract MultiLayered {
  x: Int;
  nested: NestedStructA;

  init() {
    self.x = 1;
    self.nested = NestedStructA{
      y:2,
      nested: NestedStructB{ z:true }
    };
  }
}