struct OptionalStructWithDefaults {
  foo: Int? = null;
  bar: Bool? = null;
}

contract StructOptDefaultsStorage {
  data: OptionalStructWithDefaults;

  init() {
    self.data = OptionalStructWithDefaults{};
  }
}