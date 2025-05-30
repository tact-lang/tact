struct NestedStruct {
  value: Int;
  flag: Bool;
}

contract SingleStorageFieldTest {
  nested: NestedStruct;

  init() {
    self.nested = NestedStruct{value: 42, flag: true};
  }
}