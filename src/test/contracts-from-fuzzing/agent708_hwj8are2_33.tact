struct WithDefaults {
  a: Int = 1;
  b: String = "def";
  c: Bool = true;
}

contract DefInit {
  val: WithDefaults;
  init() {
    self.val = WithDefaults{};
  }
}