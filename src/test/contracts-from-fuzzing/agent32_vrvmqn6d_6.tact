struct HasDefaults {
  a: Int = 5;
  b: String = "hello";
  c: Bool = true;
}

contract Test {
  val: HasDefaults;
  init() {
    self.val = HasDefaults{};
  }
}