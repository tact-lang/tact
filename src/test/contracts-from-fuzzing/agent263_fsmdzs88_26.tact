struct HasDefaults {
  a: Int = 7;
  b: Bool = true;
  c: String = "hi";
}

contract FieldsWithDefaults {
  data: HasDefaults;
  init() {
    self.data = HasDefaults{};
  }
}