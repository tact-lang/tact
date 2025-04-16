struct NestedStruct {
  inner: InnerStruct;
}

struct InnerStruct {
  a: Int;
  b: Bool;
}

contract StructFieldContract {
  nestedField: NestedStruct;

  init() {
    self.nestedField = NestedStruct{ inner: InnerStruct{ a: 5, b: true } };
  }
}