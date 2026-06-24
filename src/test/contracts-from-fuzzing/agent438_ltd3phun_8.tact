struct OnlyDefaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "hello";
}

contract TestContract {
  s: OnlyDefaults;

  init() {
    self.s = OnlyDefaults{};
  }
}