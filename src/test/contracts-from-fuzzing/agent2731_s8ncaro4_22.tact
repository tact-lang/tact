struct DeepDefaults {
  x: Int = 10;
  s: String = "z";
}

struct Layer {
  inner: DeepDefaults = DeepDefaults{};
}

contract InnerDefaults {
  lvl: Layer = Layer{};

  init() {
    self.lvl = Layer{};
  }
}