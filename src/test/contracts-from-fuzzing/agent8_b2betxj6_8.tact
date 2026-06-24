struct OptionalDeepInner {
  opt1: Int?;
  opt2: Bool?;
}

struct OptionalDeepOuter {
  inner: OptionalDeepInner?;
  flag: Bool;
}

contract OptionalNestedStructTest {
  data: OptionalDeepOuter;

  init() {
    self.data = OptionalDeepOuter{
      inner: null,
      flag: true,
    };
  }
}