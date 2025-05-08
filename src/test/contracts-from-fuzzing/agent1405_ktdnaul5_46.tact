struct DeepDefaults {
  a: Int = 1;
  b: Int? = null;
  s: String = "hi";
}

contract NestedDefaults {
  data: DeepDefaults;

  init() {
    self.data = DeepDefaults{};
  }
}