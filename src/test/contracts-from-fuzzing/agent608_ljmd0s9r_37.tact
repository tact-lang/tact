// Large struct with defaults for most fields
struct LargeDefaults {
  a: Int = 0; b: Bool = false; c: String = "";
  d: Int = -1; e: Bool = true; f: String = "hi";
  g: Int = 5; h: Bool = false; i: String = "bye";
}

contract ManyDefaultsContract {
  f: LargeDefaults;

  init() {
    self.f = LargeDefaults{};
  }
}
