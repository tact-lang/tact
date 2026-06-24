struct OptWithDefaults {
  a: Int?;
  b: Bool? = true;
  s: String? = "hello";
}

contract Test {
  store: OptWithDefaults;
  init() {
    self.store = OptWithDefaults{};
  }
  receive() {}
}