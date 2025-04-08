struct NestedStruct {
  foo: Int;
  bar: Bool?;
}

contract DeepOptionalTest {
  data: NestedStruct?;

  init() {
    self.data = null;
  }
}