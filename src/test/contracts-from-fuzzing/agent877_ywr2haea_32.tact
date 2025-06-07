// Struct with several optionals default-initialized
struct OptDefaults {
  a: Int?;
  b: String?;
  c: Bool?;
}

contract DefaultNulls {
  field: OptDefaults;

  init() {
    self.field = OptDefaults{};
  }
}