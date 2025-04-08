struct NestedDefaults {
  x: Int = 42;
  y: Bool = false;
  z: String = "n";
}

contract NestedStructDefault {
  s: NestedDefaults;

  init() {
    self.s = NestedDefaults{};
  }
}