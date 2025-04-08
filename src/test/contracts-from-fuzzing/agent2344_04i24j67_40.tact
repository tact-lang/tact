struct TestStruct {
  a: Int;
  b: Bool;
}

contract InitStruct {
  s: TestStruct;

  init() {
    self.s = TestStruct { a: 21, b: true };
  }
}