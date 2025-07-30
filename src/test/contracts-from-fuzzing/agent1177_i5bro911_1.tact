struct NestedStruct {
  inner_val: Int;
}

contract SingleStructField {
  nested: NestedStruct;

  init() {
    self.nested = NestedStruct{ inner_val: 123 };
  }
}
