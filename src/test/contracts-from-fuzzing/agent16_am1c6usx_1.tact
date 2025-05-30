struct InnerStruct {
  x: Int;
  y: Int?;
}

contract DeepNested {
  data: InnerStruct;

  init() {
    self.data = InnerStruct{ x: 1, y: null };
  }
}
