struct WithDefaults {
  a: Int = 10;
  b: Bool?;
  c: String = "hello";
  d: String?;
}

contract DefaultsTest {
  stored: WithDefaults;
  init() {
    self.stored = WithDefaults{
      a: 42,
      b: null,
      c: "something",
      d: null,
    };
  }
}