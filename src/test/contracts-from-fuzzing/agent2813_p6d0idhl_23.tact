struct OptionalDeepWithDefaults {
  inner: Middle?;
}

struct Middle {
  inner2: Bottom?;
}

struct Bottom {
  num: Int = 42;
  flag: Bool = true;
}

contract TestOptDeepDefaults {
  s: OptionalDeepWithDefaults;
  init() {
    self.s = OptionalDeepWithDefaults{
      inner: Middle{
        inner2: Bottom{}
      }
    };
  }
}
