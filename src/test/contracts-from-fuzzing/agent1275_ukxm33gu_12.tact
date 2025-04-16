struct OptionalsAndDefaults {
  foo: Int? = null;
  bar: Bool = true;
  baz: String = "";
}

contract DefaultsInStruct {
  s: OptionalsAndDefaults;

  init() {
    self.s = OptionalsAndDefaults{};
  }
}