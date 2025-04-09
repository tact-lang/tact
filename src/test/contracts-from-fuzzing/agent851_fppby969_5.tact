struct NestedOptional {
  inner: InnerStruct?;
}

struct InnerStruct {
  v1: Int;
  v2: String?;
}

contract NestedOptionalTest {
  data: NestedOptional;
  init() {
    self.data = NestedOptional{
      inner: null
    };
  }
}