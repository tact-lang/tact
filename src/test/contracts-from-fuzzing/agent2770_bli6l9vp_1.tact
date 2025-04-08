struct NestedStruct {
  a: Int;
  b: Int?;
}

contract DeepNestTest {
  record: NestedStruct;
  
  init() {
    self.record = NestedStruct{
      a: 5,
      b: null,
    };
  }
}