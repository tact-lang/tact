struct OptDefaults {
  a: Int? = null;
  b: String? = null;
}

contract ManyOptDefaultsStructField {
  v: OptDefaults;

  init() {
    self.v = OptDefaults{};
  }
}