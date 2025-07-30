struct WithDefault {
  x: Int = 5;
}

contract StructWithDefaultInit {
  f: WithDefault;

  init() {
    self.f = WithDefault{};
  }
}