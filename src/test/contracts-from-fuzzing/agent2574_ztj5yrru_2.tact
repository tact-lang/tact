struct DeepInner {
  a: Int;
  b: Bool;
}

struct DeepOuter {
  nested: DeepInner;
  flag: Bool;
}

contract DeepNesting {
  storage: DeepOuter;

  init() {
    self.storage = DeepOuter{
      nested: DeepInner{ a: 1, b: true },
      flag: false
    };
  }
}