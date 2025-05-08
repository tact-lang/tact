struct DeepDefaults {
  x: Int = 1;
  y: Int = 2;
  z: Int = 3;
}

struct Nested {
  inner: DeepDefaults = DeepDefaults{};
}

contract TestContract {
  data: Nested;

  init() {
    self.data = Nested{};
  }
}