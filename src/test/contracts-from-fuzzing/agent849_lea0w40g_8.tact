struct WithDefaults {
  f1: Int = 5;
  f2: Bool = true;
  f3: String = "ok";
  f4: Int?;
}

contract TestContract {
  s: WithDefaults;

  init() {
    self.s = WithDefaults{ };
  }
}