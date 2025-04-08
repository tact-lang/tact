struct WithDefaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "hello";
}

contract UseDefaults {
  val: WithDefaults;

  init() {
    self.val = WithDefaults{};
  }
}