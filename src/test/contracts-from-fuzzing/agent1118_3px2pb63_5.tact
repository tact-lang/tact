struct NestedStruct {
  inner: InnerStruct;
}

struct InnerStruct {
  value: Int;
  optionalValue: String?;
}

contract StructOrderTest {
  data: NestedStruct;

  init() {
    self.data = NestedStruct{
      inner: InnerStruct{
        value: 123,
        optionalValue: null
      }
    };
  }
}