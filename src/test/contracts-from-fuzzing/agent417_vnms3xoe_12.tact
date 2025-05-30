struct Defaults {
  foo: Int = 10;
  bar: Bool = true;
  baz: String = "ok";
}

contract ConstDefaults {
  holder: Defaults;

  init() {
    self.holder = Defaults{};
  }
}