struct WithDefaults {
  x: Int = 10;
  y: Bool = false;
  s: String = "hello";
  opt: Int?; // defaults to null
}

contract StructDefaultTest {
  state: WithDefaults;

  init() {
    self.state = WithDefaults{};
  }
}