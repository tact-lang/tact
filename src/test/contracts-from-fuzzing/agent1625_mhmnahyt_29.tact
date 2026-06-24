struct StructBoolDefaults {
  b1: Bool = true;
  b2: Bool = false;
}

contract BoolDefaultsStorage {
  s: StructBoolDefaults;

  init() {
    self.s = StructBoolDefaults{};
  }
}
