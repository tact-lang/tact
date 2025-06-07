struct OptionalWithDefaults {
  oi: Int? = null;
  ob: Bool? = null;
  os: String? = null;
}

contract TestOptionalWithDefaults {
  data: OptionalWithDefaults;

  init() {
    self.data = OptionalWithDefaults{};
  }
}
