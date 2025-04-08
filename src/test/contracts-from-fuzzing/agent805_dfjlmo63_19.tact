struct OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
}

contract OptDefaults {
  data: OptionalDefaults;

  init() {
    self.data = OptionalDefaults{};
  }
}
