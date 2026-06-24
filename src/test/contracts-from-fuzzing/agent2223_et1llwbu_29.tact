struct StructA {
  x: Int;
}

struct StructB {
  a: StructA;
  b: StructA?;
}

struct StructC {
  nested1: StructB?;
  nested2: StructB?;
}

contract NestedMultiOption {
  value: StructC?;

  init() {
    self.value = null;
  }
}