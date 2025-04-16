struct InnerStruct {
  a: Int;
  b: Bool?;
}

contract NestedOpt {
  data: InnerStruct;

  init() {
    self.data = InnerStruct{a: 0, b: null};
  }
}
