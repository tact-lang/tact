struct InnerStruct {
  a: Int;
  b: Bool;
}

contract TestPersist {
  nested: InnerStruct;

  init() {
    self.nested = InnerStruct{ a: 1, b: true };
  }
}