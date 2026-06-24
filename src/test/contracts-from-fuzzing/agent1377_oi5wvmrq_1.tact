struct NestedStruct {
  field1: Int;
  field2: Bool;
}

contract TestContract {
  data: NestedStruct;

  init() {
    self.data = NestedStruct{field1: 1, field2: true};
  }
}