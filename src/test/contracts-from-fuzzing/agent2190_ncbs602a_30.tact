struct Little {
  a: Int;
}

contract NestedOptionalStruct {
  val: Little?;
  init() {
    self.val = null;
  }
}