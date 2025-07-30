struct WithDefaults {
  a: Int = 42;
  b: Bool?;
  c: String = "abc";
}

contract TestContract {
  data: WithDefaults;

  init() {
    self.data = WithDefaults {
      b: null,
    };
  }
}