struct InnerStruct {
  a: Int;
  b: String;
}

contract DeepNestedTest {
  s: InnerStruct;

  init() {
    self.s = InnerStruct{a: 1, b: "test"};
  }
}