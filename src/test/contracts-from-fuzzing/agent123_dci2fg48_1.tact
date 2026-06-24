struct NestedStruct {
  sfield1: Int;
  sfield2: Bool?;
}

contract DeeplyNestedContract {
  nested: NestedStruct;
  num: Int;

  init() {
    self.nested = NestedStruct{
      sfield1: 456,
      sfield2: true
    };
    self.num = 123;
  }
}