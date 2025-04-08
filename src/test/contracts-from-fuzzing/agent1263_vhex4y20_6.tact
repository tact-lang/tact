struct OptionalsAndDefaults {
  foo: Int?;
  bar: Bool = true;
  baz: Int = 42;
  qux: Bool?;
}

contract TestContract {
  val: OptionalsAndDefaults;

  init() {
    self.val = OptionalsAndDefaults{
      foo: null,
      qux: false
    };
  }
}