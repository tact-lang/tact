struct HasDefault {
  foo: Int = 42;
  bar: Bool = true;
  baz: String = "Hi";
}

contract DefaultFields {
  data: HasDefault;

  init() {
    self.data = HasDefault{};
  }
}