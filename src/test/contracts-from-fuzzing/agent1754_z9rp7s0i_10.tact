struct DeepDefaults {
  nested: InnerDefaults;
}

struct InnerDefaults {
  foo: Int = 1;
  bar: Bool = false;
}

contract DefaultDeepTest {
  val: DeepDefaults;
  init() {
    self.val = DeepDefaults{
      nested: InnerDefaults{}
    };
  }
}