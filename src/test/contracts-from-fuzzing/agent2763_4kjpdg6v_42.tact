struct EmptyDefault {
  n: Int? = null;
}

contract DeepDefaults {
  d1: EmptyDefault;
  d2: EmptyDefault;

  init() {
    self.d1 = EmptyDefault{};
    self.d2 = EmptyDefault{};
  }
}