struct OptionalWithDefaults {
  a: Int? = null;
  b: String? = null;
  c: Bool? = null;
}

contract Test46 {
  o: OptionalWithDefaults;

  init() {
    self.o = OptionalWithDefaults{};
  }
}