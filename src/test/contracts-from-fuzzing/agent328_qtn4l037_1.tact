struct InnerStruct {
  val1: Int;
  val2: Bool;
}

contract TestContract {
  nestedField: InnerStruct;

  init() {
    self.nestedField = InnerStruct{ val1: 1, val2: true };
  }
}