struct DeepNested {
  inner: InnerStruct;
}

struct InnerStruct {
  x: Int;
  y: String;
}

contract NestedStructContract {
  nested: DeepNested;

  init() {
    self.nested = DeepNested{
      inner: InnerStruct{x: 1, y: "test"}
    };
  }
}