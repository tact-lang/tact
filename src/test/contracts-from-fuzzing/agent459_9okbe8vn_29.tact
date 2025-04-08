struct DeepDefaults {
  x: Int = 1;
}

struct DeepWithDefaults {
  nested: DeepDefaults;
}

contract NestedDefaults {
  s: DeepWithDefaults;

  init() {
    self.s = DeepWithDefaults{
      nested: DeepDefaults{}
    };
  }
}