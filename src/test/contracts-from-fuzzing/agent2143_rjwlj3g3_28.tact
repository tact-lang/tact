struct BoolWithDefaults {
  f1: Bool = true;
  f2: Bool = false;
}

contract BoolDefaultsStorage {
  data: BoolWithDefaults;

  init() {
    self.data = BoolWithDefaults{};
  }
}