struct NestingAndDefaults {
  a: Int = 5;
  b: Inner = Inner{ x: 10 };
}

struct Inner {
  x: Int;
}

contract Test {
  s: NestingAndDefaults;
  init() {
    self.s = NestingAndDefaults{};
  }
}