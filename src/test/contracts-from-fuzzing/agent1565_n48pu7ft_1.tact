struct NestedStruct {
  val1: Int;
  val2: Int?;
}

contract TestContract {
  myField: NestedStruct;

  init() {
    self.myField = NestedStruct{ val1: 1, val2: null };
  }
}