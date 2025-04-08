struct MultiDefaults {
  a: Int = 10;
  b: Bool = false;
  c: String = "z";
}

contract DefaultStructFields {
  foo: MultiDefaults;

  init() {
    self.foo = MultiDefaults{};
  }
}