struct Inner {
  a: Int;
  b: Bool;
  c: String;
}

contract DeepNestedTest {
  nested: Inner;
  num: Int = 1;
  flag: Bool = false;

  init() {
    self.nested = Inner{ a: 10, b: true, c: "hi" };
  }
}