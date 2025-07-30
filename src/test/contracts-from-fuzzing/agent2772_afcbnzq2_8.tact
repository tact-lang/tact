struct WithStringDefaults {
  s1: String = "hello";
  s2: String = "";
  s3: String = "world";
}

contract TestWithStringDefaults {
  data: WithStringDefaults;

  init() {
    self.data = WithStringDefaults{};
  }
}
