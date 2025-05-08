struct NestedStruct {
  a: Int;
  b: Bool;
}

contract DeepNestedTest {
  s: NestedStruct;
  
  init() {
    self.s = NestedStruct{a: 1, b: true};
  }
}
