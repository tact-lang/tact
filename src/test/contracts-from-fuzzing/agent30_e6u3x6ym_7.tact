struct DeepInner {
  flag: Bool = false;
}

struct Inner {
  id: Int = 1337;
  info: DeepInner = DeepInner{};
}

contract Test {
  nested: Inner;

  init() {
    self.nested = Inner{};
  }
}