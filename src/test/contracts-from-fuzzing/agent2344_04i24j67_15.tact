struct DeepDefaults {
  x: Int = 1;
  y: Bool = false;
  z: String = "hi";
}

struct Container {
  inner: DeepDefaults;
}

contract InnerDefaults {
  val: Container;

  init() {
    self.val = Container { inner: DeepDefaults{} };
  }
}