struct DeeplyNested {
  inner: InnerStruct;
}

struct InnerStruct {
  x: Int;
  y: Bool;
}

contract DeepStorage {
  val: Int = 5;
  nested: DeeplyNested = DeeplyNested{inner: InnerStruct{x: 1, y: false}};

  init() {
    self.val = 42;
    self.nested = DeeplyNested{inner: InnerStruct{x: 99, y: true}};
  }
}
