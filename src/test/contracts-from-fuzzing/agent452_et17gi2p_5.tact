struct Inner {
  flag: Bool;
}

struct Middle {
  inner: Inner?;
  count: Int;
}

contract ComplexOptional {
  storage: Middle?;

  init() {
    self.storage = null;
  }
}