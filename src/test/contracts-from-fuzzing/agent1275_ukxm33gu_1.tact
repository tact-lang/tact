struct NestedStruct {
  level1: Int;
  level2: Int?;
  level3: Int;
}

contract DeepOptionalTest {
  s: NestedStruct?;

  init() {
    self.s = null;
  }
}