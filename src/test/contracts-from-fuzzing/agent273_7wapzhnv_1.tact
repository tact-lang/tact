struct NestedStruct {
  val1: Int;
  val2: Bool;
}

contract TestContract {
  nested: NestedStruct;

  init() {
    self.nested = NestedStruct{ val1: 1, val2: true };
  }
}