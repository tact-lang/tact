struct PrimitiveDefaults {
  x: Int = 5;
  y: Bool = false;
  z: String = "hi";
}

contract InitializePrimitiveDefaults {
  f: PrimitiveDefaults;
  init() {
    self.f = PrimitiveDefaults{};
  }
}