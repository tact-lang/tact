struct DeepDefaults {
  x: Int = 5;
  y: Bool = false;
  z: String = "hello";
}

contract DefaultsInStruct {
  s: DeepDefaults;

  init() {
    self.s = DeepDefaults{};
  }
}