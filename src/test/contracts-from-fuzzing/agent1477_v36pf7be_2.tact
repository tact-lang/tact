struct NestedLevel2 {
  value1: Int;
  flag: Bool;
}

struct NestedLevel1 {
  n2: NestedLevel2;
}

contract DoubleNested {
  nested: NestedLevel1;

  init() {
    self.nested = NestedLevel1{n2: NestedLevel2{value1: 10, flag: false}};
  }
}