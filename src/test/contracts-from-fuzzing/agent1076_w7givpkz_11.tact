struct HasDefaults {
  a: Int = 5;
  b: String = "hi";
  c: Bool = true;
}

contract TestDefaults {
  foo: HasDefaults;

  init() {
    self.foo = HasDefaults{};
  }
}
