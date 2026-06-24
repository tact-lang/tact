struct NestedStruct {
  x: Int;
  y: Int?;
}

contract DeepOptionalTest {
  data: NestedStruct?;

  init() {
    self.data = null;
  }
}
