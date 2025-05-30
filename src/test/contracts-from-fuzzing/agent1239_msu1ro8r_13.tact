struct HasDefaults {
  x: Int = 5;
  y: Bool = true;
  z: String = "default";
}

contract StructWithDefaults {
  f: HasDefaults;

  init() {
    self.f = HasDefaults{};
  }
}