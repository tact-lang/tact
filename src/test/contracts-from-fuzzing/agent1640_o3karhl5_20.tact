struct WithDefaults {
  a: Int = 42;
  b: Bool = true;
  c: String = "hello";
}

contract DefaultsStorage {
  val: WithDefaults;

  init() {
    self.val = WithDefaults{};
  }
}