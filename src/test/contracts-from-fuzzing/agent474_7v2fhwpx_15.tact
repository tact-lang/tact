struct DeepOption {
  inner: Int?;
}

struct NestedStruct {
  innerStruct: DeepOption?;
}

contract Test {
  field: NestedStruct;

  init() {
    self.field = NestedStruct{
      innerStruct: DeepOption{ inner:null }
    };
  }
}
