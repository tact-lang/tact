struct HasDefaults {
  a: Int = 5;
  b: Bool = true;
  c: String = "def";
}

contract TestContract {
  data: HasDefaults;

  init() {
    self.data = HasDefaults{};
  }
}
