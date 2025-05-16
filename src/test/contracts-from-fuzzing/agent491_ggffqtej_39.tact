struct OptWithDefault {
  a: Int? = null;
  b: Bool? = null;
}

contract OptDefaultTest {
  oo: OptWithDefault;

  init() {
    self.oo = OptWithDefault{};
  }
}
