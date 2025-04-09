struct OptionalDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Address? = null;
}

contract TestContract {
  od: OptionalDefaults;

  init() {
    self.od = OptionalDefaults{};
  }
}