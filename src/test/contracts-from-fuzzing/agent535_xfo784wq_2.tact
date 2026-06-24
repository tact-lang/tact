struct NestedStruct {
  inner: Int;
}

struct OuterStruct {
  nested: NestedStruct;
  val: Int;
}

contract NestedStructStorage {
  outer: OuterStruct;

  init() {
    self.outer = OuterStruct{nested: NestedStruct{inner: 42}, val: 1};
  }
}