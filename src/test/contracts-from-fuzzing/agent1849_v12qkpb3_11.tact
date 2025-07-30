struct NestedOptional {
  inner: InnerOpt?;
}

struct InnerOpt {
  flag: Bool;
}

contract OptionalNestedStructTest {
  d: NestedOptional;

  init() {
    self.d = NestedOptional{ inner: null };
  }
}