struct HasDefaults {
  x: Int = 42;
  y: Bool = true;
}

contract TestContract {
  data: HasDefaults;

  init() {
    self.data = HasDefaults{};
  }
}
