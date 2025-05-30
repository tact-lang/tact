struct WithDefaults {
  a: Int = 37;
  b: Bool = false;
  s: String = "hi";
}

contract Test {
  w: WithDefaults = WithDefaults{};
  init() {}
  receive() {}
}