struct ManyDefaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "test";
}

contract DefaultsEverywhere {
  data: ManyDefaults;

  init() {
    self.data = ManyDefaults{};
  }
}