struct Inner {
  val: Int;
}

contract DeepNestedTest {
  nested: Inner;

  init() {
    self.nested = Inner{val: 42};
  }
}