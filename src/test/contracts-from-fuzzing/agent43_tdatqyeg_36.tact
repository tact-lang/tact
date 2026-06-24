struct EmptyDefaults {
  i: Int = 0;
  b: Bool = false;
}

contract ImplicitDefaults {
  e: EmptyDefaults;

  init() {
    self.e = EmptyDefaults{};
  }
}