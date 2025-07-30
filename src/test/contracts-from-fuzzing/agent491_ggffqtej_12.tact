struct HasDefaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "abc";
}

contract Defaulted {
  s: HasDefaults;

  init() {
    self.s = HasDefaults{};
  }
}
