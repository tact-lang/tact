struct StructA {
  x: Int;
  y: Bool;
}

struct StructB {
  a: StructA;
  s: String;
}

contract NestedDefaults {
  nested: StructB = StructB{a: StructA{x: 1, y: true}, s: "hi"};

  init() {
    self.nested = StructB{a: StructA{x: 2, y: false}, s: "bye"};
  }
}