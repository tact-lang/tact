struct WithDefaults {
  a: Int = 10;
  b: Bool = true;
}

contract WeirdInitOpt {
  f: WithDefaults?;

  init() {
    self.f = WithDefaults{};  
  }
}