struct NestedStruct {
  inner: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
}

contract Test {
  val: NestedStruct?;

  init() {
    self.val = null;
  }
}
