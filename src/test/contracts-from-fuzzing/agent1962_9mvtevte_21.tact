struct TestStruct {
  a: Int;
  b: Bool;
  c: String;
}

contract NullInit {
  foo: TestStruct?;

  init() {
    self.foo = null;
  }
}