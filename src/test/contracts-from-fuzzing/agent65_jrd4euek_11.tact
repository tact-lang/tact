struct WithDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "ok";
}

contract DefaultsPersist {
  val: WithDefaults;
  init() {
    self.val = WithDefaults{};
  }
}