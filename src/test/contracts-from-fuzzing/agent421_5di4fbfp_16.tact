struct ManyOptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: Address? = null;
  d: String? = null;
}

contract OptionalDefaults {
  s: ManyOptionalDefaults;

  init() {
    self.s = ManyOptionalDefaults{};
  }
}