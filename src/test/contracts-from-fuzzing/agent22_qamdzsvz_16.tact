struct InnerX { a: Int? }

struct OuterX {
  field: InnerX?;
}

contract NullableNestedStruct {
  data: OuterX?;

  init() {
    self.data = null;
  }
}