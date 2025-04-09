struct WithDefaults {
  a: Int = 1;
  b: Bool = true;
  s: String = "hello";
  o: Int?;
}

contract DefaultsTest {
  data: WithDefaults;
  init() {
    self.data = WithDefaults{ s: "world" };
  }
}