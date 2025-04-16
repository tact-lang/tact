struct StrDefaults {
  a: String = "alpha";
  b: String = "beta";
  c: String = "gamma";
}

contract DefaultedStrings {
  val: StrDefaults;

  init() {
    self.val = StrDefaults{};
  }
}
