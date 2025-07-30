struct InnerDefaults {
  foo: Int? = null;
  bar: Int = 17;
}

contract Test {
  data: InnerDefaults?;

  init() {
    self.data = null;
  }
}